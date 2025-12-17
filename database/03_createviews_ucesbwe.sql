
--======================================
--======================================
--create a view for latest parameter--

drop view if exists ucesbwe.latest_parameter cascade;

create view ucesbwe.latest_parameter as

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. find the latest reports using a group by statement 

with 
latest_parameters as 
(select parameter_type, parameter_item_category, parameter_item_name, max(date_created) as date_created
from ucesbwe.parameter
group by parameter_type, parameter_item_category, parameter_item_name)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 2. inner join the rest of the parameter details

select a.parameter_id, a.parameter_value, a.parameter_unit, b.* 
from ucesbwe.parameter a inner join 
 latest_parameters b
on a.parameter_type = b.parameter_type
and a.parameter_item_category = b.parameter_item_category
and a.parameter_item_name = b.parameter_item_name
and a.date_created = b.date_created;



--======================================
--======================================
--create a view for question 5 --

drop view if exists ucesbwe.pitches_ground_surface_conversion_cost cascade;

create view ucesbwe.pitches_ground_surface_conversion_cost as

with 

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. get the pitches whose ground surface type are not 'multi-surface'

pitches_need_conversion as
(Select pitch_id, pitch_number, pitch_ground_surface_type, st_area(location) as pitch_area
From ucesbwe.pitch 
Where pitch_ground_surface_type <> 'multi-surface'),


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 2. get the latest updated cost to convert ground surface to multi-surface

conversion_to_multi_surface as
(select parameter_item_name, parameter_item_category, parameter_item_name, parameter_value, parameter_unit, date_created
From ucesbwe.latest_parameter
Where parameter_item_category = 'ground_surface_conversion_to' 
and parameter_item_name = 'multi-surface'),


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 3.get the conversion cost of every pitch

individual_pitch_conversion_cost as
(Select a.*, b.*
from pitches_need_conversion a, conversion_to_multi_surface b)


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 4.created view from calculating the average, total costs of all the pitches
 
Select avg(parameter_value * pitch_area) as average_conversion_cost, sum(parameter_value * pitch_area) as total_conversion_cost, parameter_unit as unit, date_created
From individual_pitch_conversion_cost
Group by parameter_unit, date_created;






--======================================
--======================================
--create a view for question 6 --

drop view if exists ucesbwe.zone_with_highest_ground_surface_conversion_cost cascade;

create view ucesbwe.zones_with_highest_ground_surface_conversion_cost as

with 

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. join the pithes with the zones where they are located 

zone_right_join_pitch as
(select a.zone_id, a.zone_name, b.*
from ucesbwe.parking_zone a 
right join ucesbwe.pitch b
on (a.zone_id = b.zone_id)),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 2. filter and find the zones and pitches contained whose ground type needs to be converted to multi-surface

zone_pitches_need_conversion as
(Select zone_name, pitch_number, pitch_ground_surface_type, st_area(location) as pitch_area
From zone_right_join_pitch
Where pitch_ground_surface_type <> 'multi-surface'),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 3. get the conversion cost of every pitch

conversion_to_multi_surface as
(select parameter_item_name, parameter_item_category, parameter_item_name, parameter_value, parameter_unit, date_created
From ucesbwe.latest_parameter
Where parameter_item_category = 'ground_surface_conversion_to' 
and parameter_item_name = 'multi-surface'),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 4. get the conversion cost of every pitch with each zone

zone_individual_pitch_conversion_cost as
(Select a.*, b.*
from zone_pitches_need_conversion a, conversion_to_multi_surface b),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 5. calculate the total cost to convert pitches within each zone
zone_conversion_cost as

(select zone_name, sum(parameter_value * pitch_area) as total_cost, parameter_unit as unit, date_created
From zone_individual_pitch_conversion_cost
Group by zone_name, parameter_unit, date_created)

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 6. Get the final view, showing the zone_name with highest cost to convert its pitches to multi-surface type.

Select zone_name, max(total_cost) as max_total_cost, unit, date_created
From zone_conversion_cost
Where total_cost = (select max(total_cost) from zone_conversion_cost)
Group by zone_name, unit, date_created;





--======================================
--======================================
--create a view for question 7 --

drop view if exists ucesbwe.site_with_higher_ground_surface_conversion_cost cascade;

create view ucesbwe.site_with_higher_ground_surface_conversion_cost as


With
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 1. join the pitches with the zones where they are located 

zone_right_join_pitch as
(select a.caravan_site_id, a.zone_id, a.zone_name, b.*
from ucesbwe.parking_zone a 
right join ucesbwe.pitch b
on (a.zone_id = b.zone_id)),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 2. filter and find the zones and pitches contained whose ground type needs to be converted to multi-surface

zone_pitches_need_conversion as
(Select caravan_site_id, zone_name, pitch_number, pitch_ground_surface_type, st_area(location) as pitch_area
From zone_right_join_pitch
Where pitch_ground_surface_type <> 'multi-surface'),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 3. get the conversion cost of every pitch

conversion_to_multi_surface as
(select parameter_item_name, parameter_item_category, parameter_item_name, parameter_value, parameter_unit, date_created
From ucesbwe.latest_parameter
Where parameter_item_category = 'ground_surface_conversion_to' 
and parameter_item_name = 'multi-surface'),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 4. get the conversion cost of every pitch with each zone

zone_individual_pitch_conversion_cost as
(Select c.*, d.*
from zone_pitches_need_conversion c, conversion_to_multi_surface d),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 5. calculate the total cost to convert pitches within each zone

zone_conversion_cost as
(select caravan_site_id, zone_name, sum(parameter_value * pitch_area) as total_cost, parameter_unit as unit, date_created
From zone_individual_pitch_conversion_cost
Group by zone_name, caravan_site_id, parameter_unit, date_created),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 6. join the conversion cost of each zone with caravan_site where the zones are located

site_right_join_zone_cost as
(Select e.caravan_site_name, f.zone_name, f.total_cost, f.unit, f.date_created
From ucesbwe.caravan_site e 
Right join zone_conversion_cost f
on(e.caravan_site_id = f.caravan_site_id)),

--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 7. Sum up the total conversion cost of each site

site_conversion_cost as
(Select caravan_site_name, sum(total_cost) as total_cost, unit, date_created
From site_right_join_zone_cost
Group by caravan_site_name, unit, date_created)


--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 8. Get the final view, showing the caravan site with higher cost to convert its zones to multi-surface type.

Select caravan_site_name, max(total_cost) as max_total_cost, unit, date_created
From site_conversion_cost
Where total_cost = (select max(total_cost) from site_conversion_cost)
Group by caravan_site_name, unit, date_created;




























