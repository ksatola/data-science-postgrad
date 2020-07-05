SELECT p.name, p.geom
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming'
AND SDO_INSIDE (p.geom, s.geom ) = 'TRUE'; 

create table ksatola_wyoming_parks as
SELECT p.name, p.geom
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming'
AND SDO_INSIDE (p.geom, s.geom ) = 'TRUE';

create table ksatola_wyoming_parks as
SELECT p.name, p.geom
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming'
AND SDO_INSIDE (p.geom, s.geom ) = 'TRUE';

select * from ksatola_wyoming_parks

select * from us_states where state = 'Wyoming'

create table ksatola_wyoming_parks2 as
SELECT p.name, p.geom
FROM us_parks p, us_states s
WHERE s.state = 'Wyoming' AND SDO_ANYINTERACT (
p.geom, s.geom ) = 'TRUE';
select * from ksatola_wyoming_parks2