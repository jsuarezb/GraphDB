DROP VIEW MemberPairs;

-- Vista con los pares de usuarios que estuvieron en una misma call (excluyendo x R x).
CREATE OR REPLACE VIEW MemberPairs(MemberId1, MemberId2) AS (
	SELECT DISTINCT MIN(EmisorReceptorAux1.Id), MIN(EmisorReceptorAux2.Id)
    FROM Call AS Call1 
    	INNER JOIN Call AS Call2
    	ON Call1.id = Call2.id
    	INNER JOIN EmisorReceptor AS EmisorReceptor1
    	ON Call1.MemberId = EmisorReceptor1.Id 
      INNER JOIN EmisorReceptor AS EmisorReceptorAux1
      ON EmisorReceptorAux1.UserName = EmisorReceptor1.UserName 
    	INNER JOIN EmisorReceptor AS EmisorReceptor2
    	ON Call2.MemberId = EmisorReceptor2.Id
      INNER JOIN EmisorReceptor AS EmisorReceptorAux2
      ON EmisorReceptorAux2.UserName = EmisorReceptor2.UserName 
    WHERE EmisorReceptor1.UserName <> EmisorReceptor2.UserName
    GROUP BY EmisorReceptor1.UserName, EmisorReceptor2.UserName
);

-- Tabla recursiva donde se halla la clasura transitiva de R. (x R y ^ y R z -> x R z)
-- MemberId1, MemberId2: Id de los dos miembros que se relacionan.
-- Distance: Distancia del camino entre MemberId1 y MemberId2.
-- Path: Listado de nodos en el camino entre MemberId1 y MemberId2.
-- Cycle: Si el camino es un ciclo. 
WITH RECURSIVE UserDistances(MemberId1, MemberId2, Distance, Path, Cycle) AS (
    -- Caso Base: Si x R y, la distancia entre x e y es 1.
    SELECT MemberId1, MemberId2, 1, ARRAY[MemberId1, MemberId2], false 
    FROM MemberPairs
    -- Si el threshold es -1 (sin límite), agregar todas las tuplas. 
    -- Sino el threshold debe ser mayor a 1. 
    WHERE :'threshold' = -1 OR :'threshold' > 1
  UNION
    -- Si x -> y tiene distancia d ^ y R z ^ x != z, agregar x -> z con distancia d + 1
    SELECT UserDistances.MemberId1, MemberPairs.MemberId2, UserDistances.Distance + 1,
      Path || MemberPairs.MemberId2, MemberPairs.MemberId2 = ANY(Path)
    FROM UserDistances
        INNER JOIN MemberPairs
        ON UserDistances.MemberId2 = MemberPairs.MemberId1
    WHERE UserDistances.MemberId1 <> MemberPairs.MemberId2
      AND NOT Cycle
      -- Si el threshold es -1 (sin límite), agregar todas las tuplas. 
      -- Sino la nueva distancia debe ser menor al threshold.
      AND (:'threshold' = -1 OR UserDistances.Distance + 1 < :'threshold')
),
-- Obtener nombre de usuario a partir del id, y la distancia mínima.
-- Sólo conservar las tuplas que contienen a 'user', y posicionarlo en la columna derecha. 
UserDistancesFiltered(UserName1, UserName2, Distance) AS (
  SELECT 
    CASE WHEN EmisorReceptorAux1.UserName = :'user' 
      THEN EmisorReceptorAux1.UserName 
      ELSE EmisorReceptorAux2.UserName END,
    CASE WHEN EmisorReceptorAux1.UserName = :'user' 
      THEN EmisorReceptorAux2.UserName 
      ELSE EmisorReceptorAux1.UserName END,  
    MIN(Distance)
  FROM UserDistances
    INNER JOIN EmisorReceptor AS EmisorReceptorAux1
    ON EmisorReceptorAux1.Id = UserDistances.MemberId1
    INNER JOIN EmisorReceptor AS EmisorReceptorAux2
    ON EmisorReceptorAux2.Id = UserDistances.MemberId2
  WHERE EmisorReceptorAux1.UserName = :'user' OR EmisorReceptorAux2.UserName = :'user'  
  GROUP BY MemberId1, MemberId2, EmisorReceptorAux1.UserName, EmisorReceptorAux2.UserName  
),
-- Agregar x R x con distancia 0 si es que el threshold no es 0.
UserDistancesReflex(UserName1, UserName2, Distance) AS (
    SELECT * FROM UserDistancesFiltered
  UNION ALL  
    SELECT :'user', :'user', 0
    WHERE :'threshold' <> 0
),
-- Si no existe una tupla (x, y) donde x R y, entonces x no alcanza a y, y se lo marca con distancia -1.
-- Estas tuplas solo se agregan si el threshold es -1 (sin límite).
UserDistancesAll(UserName1, UserName2, Distance) AS (
    SELECT * FROM UserDistancesReflex
  UNION
    SELECT :'user', UserName, -1 
    FROM EmisorReceptor 
    WHERE :'threshold' = -1
      AND NOT EXISTS (
          SELECT * FROM UserDistancesReflex
          WHERE UserDistancesReflex.UserName2 = EmisorReceptor.UserName)   
)
-- Sólo mostrar un camino (sólo x -> z, y no z -> x)
SELECT UserName1, UserName2, Distance
FROM UserDistancesAll
ORDER BY UserName2
;