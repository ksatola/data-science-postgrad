select * from us_interstates
where interstate = 'I4'

select * from us_states
where state_abrv = 'FL'

create table ksatola_t5 as
SELECT c.city, c.state_abrv, c.location FROM us_cities c
WHERE ROWID IN ( SELECT c.rowid
FROM us_interstates i, us_cities c WHERE
i.interstate = 'I4'
AND sdo_within_distance (
c.location, i.geom,'distance=50 unit=mile')
= 'TRUE' );

create table ksatola_t5a3 as
SELECT c.county, c.state_abrv, c.location FROM us_cities c
WHERE ROWID IN ( SELECT c.rowid
FROM us_interstates i, us_counties c WHERE
i.interstate = 'I4'
AND sdo_within_distance (
c.geom, i.geom,'distance=1 unit=mile')
= 'TRUE' );

SELECT s.county, s.geom FROM us_counties s
WHERE ROWID IN ( SELECT s.rowid
FROM us_interstates i, us_counties s WHERE
i.interstate = 'I4'
AND sdo_within_distance (
s.geom, i.geom, 'distance=50 unit=mile')
= 'TRUE' );

select * from ksatola_t5
select * from ksatola_t5a2