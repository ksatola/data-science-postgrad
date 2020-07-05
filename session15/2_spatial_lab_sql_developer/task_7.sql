SELECT SDO_GEOM.SDO_LENGTH (geom, 0.5, 'unit=kilometer') length
FROM us_interstates
WHERE interstate = 'I4';

SELECT SDO_GEOM.SDO_DISTANCE ( c1.location, c2.location, 0.5)
distance
FROM us_cities c1, us_cities c2
WHERE c1.city = 'Buffalo' and c2.city = 'Syracuse'; 

-- długość dróg malejąco
SELECT interstate, SDO_GEOM.SDO_LENGTH (geom, 0.5,'unit=kilometer') length
FROM us_interstates
ORDER BY SDO_GEOM.SDO_LENGTH (geom, 0.5,'unit=kilometer') DESC

-- długość rzeki Mississippi
SELECT SDO_GEOM.SDO_LENGTH (geom, 0.5, 'unit=kilometer') length
FROM us_rivers
WHERE name='Mississippi'
 
-- najdłuższe stany
SELECT state, SDO_GEOM.SDO_LENGTH (geom, 0.5,'unit=kilometer') length
FROM us_states
ORDER BY SDO_GEOM.SDO_LENGTH (geom, 0.5,'unit=kilometer') DESC