create table ksatola_t6 as
SELECT c.city, c.state_abrv, c.location FROM us_interstates i,
us_cities c WHERE i.interstate = 'I4'
AND sdo_nn(c.location, i.geom, 'sdo_num_res=5') = 'TRUE';

select * from ksatola_t6