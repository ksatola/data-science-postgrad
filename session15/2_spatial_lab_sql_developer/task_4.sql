create table ksatola_t44 as
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c,
us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=INSIDE+COVEREDBY'
) = 'TRUE'; 

create table ksatola_t43 as
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c,
us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=INSIDE'
) = 'TRUE'; 

create table ksatola_t42 as
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c,
us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=COVEREDBY'
) = 'TRUE';

create table ksatola_t4 as
SELECT c.county, c.state_abrv, c.geom
FROM us_counties c,
us_states s
WHERE s.state = 'New Hampshire'
AND SDO_RELATE ( c.geom,s.geom, 'mask=TOUCH'
) = 'TRUE';

select * from ksatola_t4
select * from ksatola_t42
select * from ksatola_t43
select * from ksatola_t44