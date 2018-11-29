DROP VIEW MemberPairs;

-- Vista con los pares de miembros que estuvieron en una misma call (excluyendo x R x).
CREATE OR REPLACE VIEW MemberPairs(MemberId1, MemberId2) AS (
	SELECT DISTINCT Call1.MemberId, Call2.MemberId
    FROM grupo2v2.Call AS Call1 
    	INNER JOIN grupo2v2.Call AS Call2
    	ON Call1.id = Call2.id
    WHERE Call1.MemberId <> Call2.MemberId
);

-- Tabla recursiva donde se halla la clasura transitiva de R. (x R y ^ y R z -> x R z)
-- MemberId1, MemberId2: Id de los dos miembros que se relacionan.
-- Distance: Distancia del camino entre MemberId1 y MemberId2.
-- Path: Listado de nodos en el camino entre MemberId1 y MemberId2.
-- Cycle: Si el camino es un ciclo. 
WITH RECURSIVE PhoneDistances(MemberId1, MemberId2, Distance, Path, Cycle) AS (
    -- Caso Base: Si x R y, la distancia entre x e y es 1.
    SELECT MemberId1, MemberId2, 1, ARRAY[MemberId1, MemberId2], false 
    FROM MemberPairs
  UNION
    -- Si x -> y tiene distancia d ^ y R z ^ x != z, agregar x -> z con distancia d + 1
    SELECT PhoneDistances.MemberId1, MemberPairs.MemberId2, PhoneDistances.Distance + 1,
      Path || MemberPairs.MemberId2, MemberPairs.MemberId2 = ANY(Path)
    FROM PhoneDistances
    	INNER JOIN MemberPairs
    	ON PhoneDistances.MemberId2 = MemberPairs.MemberId1
    WHERE PhoneDistances.MemberId1 <> MemberPairs.MemberId2
      AND NOT Cycle
),
PhoneDistancesFiltered(MemberId1, MemberId2, Distance) AS (
  SELECT MemberId1, MemberId2, MIN(Distance)
  FROM PhoneDistances
  GROUP BY MemberId1, MemberId2  
),
-- Agregar x R x con distancia 0.
PhoneDistancesReflex(MemberId1, MemberId2, Distance) AS (
	SELECT * FROM PhoneDistancesFiltered
  UNION
  	SELECT Id, Id, 0 FROM grupo2v2.EmisorReceptor 	
),
-- Todos los pares de miembros posibles.
PhonePairsAll(Id1, Id2) AS (
  SELECT EmisorReceptor1.Id, EmisorReceptor2.Id
  FROM grupo2v2.EmisorReceptor AS EmisorReceptor1, grupo2v2.EmisorReceptor AS EmisorReceptor2
),
-- Si no existe una tupla (x, y) donde x R y, entonces x no alcanza a y, y se lo marca con distancia -1.
PhoneDistancesAll(MemberId1, MemberId2, Distance) AS (
	SELECT * FROM PhoneDistancesReflex
  UNION
    SELECT Id1, Id2, -1 FROM PhonePairsAll WHERE NOT EXISTS (
    	SELECT * FROM PhoneDistancesReflex 
    	WHERE PhonePairsAll.Id1 = PhoneDistancesReflex.MemberId1 AND PhonePairsAll.Id2 = PhoneDistancesReflex.MemberId2
    		OR PhonePairsAll.Id1 = PhoneDistancesReflex.MemberId2 AND PhonePairsAll.Id2 = PhoneDistancesReflex.MemberId1
    )	
)
-- Sólo mostrar un camino (sólo x -> z, y no z -> x)
SELECT MemberId1, MemberId2, Distance
FROM PhoneDistancesAll
WHERE MemberId1 <= MemberId2
ORDER BY MemberId1, MemberId2
;