SET search_path TO :'schema';

DROP VIEW IF EXISTS PhonePairs;

-- Vista con los pares de teléfonos que estuvieron en una misma call (excluyendo x R x).
CREATE OR REPLACE VIEW PhonePairs(PhoneId1, PhoneId2) AS (
	SELECT DISTINCT Call1.MemberId, Call2.MemberId
    FROM Call AS Call1 
    	INNER JOIN Call AS Call2
    	ON Call1.id = Call2.id
    WHERE Call1.MemberId <> Call2.MemberId
);

\timing
-- Tabla recursiva donde se halla la clasura transitiva de R. (x R y ^ y R z -> x R z)
-- PhoneId1, PhoneId2: Id de los dos teléfonos que se relacionan.
-- Distance: Distancia del camino entre PhoneId1 y PhoneId2.
-- Path: Listado de nodos en el camino entre PhoneId1 y PhoneId2.
-- Cycle: Si el camino es un ciclo. 
WITH RECURSIVE PhoneDistances(PhoneId1, PhoneId2, Distance, Path, Cycle) AS (
    -- Caso Base: Si x R y, la distancia entre x e y es 1.
    SELECT PhoneId1, PhoneId2, 1, ARRAY[PhoneId1, PhoneId2], false 
    FROM PhonePairs
  UNION
    -- Si x -> y tiene distancia d ^ y R z ^ x != z, agregar x -> z con distancia d + 1
    SELECT PhoneDistances.PhoneId1, PhonePairs.PhoneId2, PhoneDistances.Distance + 1,
      Path || PhonePairs.PhoneId2, PhonePairs.PhoneId2 = ANY(Path)
    FROM PhoneDistances
    	INNER JOIN PhonePairs
    	ON PhoneDistances.PhoneId2 = PhonePairs.PhoneId1
    WHERE PhoneDistances.PhoneId1 <> PhonePairs.PhoneId2
      AND NOT Cycle
),
-- Agregar x R x con distancia 0.
PhoneDistancesReflex(PhoneId1, PhoneId2, Distance) AS (
	SELECT PhoneId1, PhoneId2, Distance 
	FROM PhoneDistances
  UNION
  	SELECT Id, Id, 0 FROM EmisorReceptor 	
)
-- Sólo mostrar un camino (sólo x -> z, y no z -> x), y el de menor distancia.
SELECT PhoneId1, PhoneId2, MIN(Distance)
FROM PhoneDistancesReflex
WHERE PhoneId1 <= PhoneId2
GROUP BY PhoneId1, PhoneId2
ORDER BY PhoneId1, PhoneId2
;