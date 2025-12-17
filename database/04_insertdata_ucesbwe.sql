--========================================================
-- INSERT DATA


--========================================================
-- PARAMETER 

insert into ucesbwe.parameter
(parameter_id, parameter_type, parameter_item_category, parameter_item_name, parameter_value, parameter_unit)

values

(Default, 'cost', 'reparation_work', 'on_pitch_drinkingwater', 800, '$ per unit'),
(Default, 'cost', 'reparation_work', 'on_pitch_greywater', 750, '$ per unit'),
(Default, 'cost', 'reparation_work', 'on_pitch_charging_hook', 1000, '$ per unit'),
(Default, 'cost', 'reparation_work', 'on_pitch_bbq_stand', 400, '$ per unit'),
(Default, 'cost', 'reparation_work', 'on_pitch_awning', 500, '$ per unit'),
(Default, 'cost', 'reparation_work', 'on_pitch_privacy_hedge', 900, '$ per unit'),
(Default, 'cost', 'reparation_work', 'on_pitch_tv_aerial_outlet', 450, '$ per unit'),
(Default, 'cost', 'reparation_work', 'toilet', 350, '$ per unit' ),
(Default, 'cost', 'reparation_work', 'cctv', 250, '$ per unit' ),
(Default, 'cost', 'reparation_work', 'fire_hydrant', 300, '$ per unit' ),
(Default, 'cost', 'reparation_work', 'vendor_machine', 200, '$ per unit' ),
(Default, 'cost', 'reparation_work', 'water_fountain', 100, '$ per unit'),
(Default, 'cost', 'upgradation', 'drainage_system', 1200, '$ per meter'),
(Default, 'cost', 'upgradation', 'shared_facilities_to_private', 1500, '$ per unit'),
(Default, 'cost', 'upgradation', 'carlo_gas_to_electricity', 1000, '$ per unit'),

(Default, 'cost', 'ground_surface_conversion_to', 'hardstanding', 10 ,'$ per sqm'),
(Default, 'cost', 'ground_surface_conversion_to', 'grass', 30, '$ per sqm'),
(Default, 'cost', 'ground_surface_conversion_to', 'multi-surface', 50, '$ per sqm'),

(Default, 'profit', 'renting_out', 'economic_pitch', 100, '$ per day'),
(Default, 'profit', 'renting_out', 'premiums_pitch', 300, '$ per day'),
(Default, 'profit', 'renting_out', 'luxury_pitch', 500, '$ per day'),

(Default, 'weighting', 'caravan_site_facility', 'leisure',1, 'times of importance'),
(Default, 'weighting', 'caravan_site_facility', 'convenience', 2, 'times of importance'),
(Default, 'weighting', 'caravan_site_facility', 'safety', 3, 'times of importance'),
(Default, 'weighting', 'on_pitch_facility', 'leisure', 2, 'times of importance'),
(Default, 'weighting', 'on_pitch_facility', 'convenience', 2, 'times of importance'),
(Default, 'weighting', 'on_pitch_facility', 'safety', 3, 'times of importance');





--========================================================
-- FACILITY STATUS LOOKUP

insert into ucesbwe.facility_status_indicator(facility_status_indicator_id, facility_status_indicator_description)
values
(1, 'Available as private'),
(2, 'Available as shared'),
(3, 'Under reparation works'),
(4, 'Not in place'),
(5, 'Unable to check status');


--========================================================
-- CARAVAN_SITE (2 of which)

insert into ucesbwe.caravan_site
(caravan_site_id, caravan_site_name, operator_name, location)
values
-- st_extrude is deprecated, use CG_EXTRUDE instead, requires PostGIS SFCGAL extension
-- (Default, 'Ellington site', 'Canopy property management', st_extrude(st_geomfromtext('POLYGON((465000 77000 0, 465000 80000 0, 468000 80000 0, 468000 77000 0, 465000 77000 0))',27700),0,0,500)),
-- (Default, 'Tizol site', 'Canopy property management', st_extrude(st_geomfromtext('POLYGON((469500 75500 100, 469500 78500 100, 472500 78500 100, 472500 75500 100, 469500 75500 100))',27700),0,0,500));
(Default, 'Ellington site', 'Canopy property management', CG_EXTRUDE(st_geomfromtext('POLYGON((465000 77000 0, 465000 80000 0, 468000 80000 0, 468000 77000 0, 465000 77000 0))',27700),0,0,500)),
(Default, 'Tizol site', 'Canopy property management', CG_EXTRUDE(st_geomfromtext('POLYGON((469500 75500 100, 469500 78500 100, 472500 78500 100, 472500 75500 100, 469500 75500 100))',27700),0,0,500));

-- full wkt script (if sfcgal extension not available)
-- (Default, 'Ellington site', 'Canopy property management', ST_GeomFromText(
--     'POLYHEDRALSURFACE (((465000 77000 0, 468000 77000 0, 468000 80000 0, 465000 80000 0, 465000 77000 0)),
--      ((465000 77000 500, 468000 77000 500, 468000 80000 500, 465000 80000 500, 465000 77000 500)),
--      ((465000 77000 0, 468000 77000 0, 468000 77000 500, 465000 77000 500, 465000 77000 0)),
--      ((468000 77000 0, 468000 80000 0, 468000 80000 500, 468000 77000 500, 468000 77000 0)),
--      ((468000 80000 0, 465000 80000 0, 465000 80000 500, 468000 80000 500, 468000 80000 0)),
--      ((465000 80000 0, 465000 77000 0, 465000 77000 500, 465000 80000 500, 465000 80000 0))
--     )', 27700)),
-- (Default, 'Tizol site', 'Canopy property management', ST_GeomFromText(
--     'POLYHEDRALSURFACE (
--     ((469500 75500 100, 472500 75500 100, 472500 78500 100, 469500 78500 100, 469500 75500 100)),
--     ((469500 75500 600, 472500 75500 600, 472500 78500 600, 469500 78500 600, 469500 75500 600)),
--     ((469500 75500 100, 472500 75500 100, 472500 75500 600, 469500 75500 600, 469500 75500 100)),
--     ((472500 75500 100, 472500 78500 100, 472500 78500 600, 472500 75500 600, 472500 75500 100)),
--     ((472500 78500 100, 469500 78500 100, 469500 78500 600, 472500 78500 600, 472500 78500 100)),
--     ((469500 78500 100, 469500 75500 100, 469500 75500 600, 469500 78500 600, 469500 78500 100))
--     )', 27700));




--========================================================
-- INSERT INTO PARKING_ZONE
--==========================
-- PARKING ZONE FOR ELLINGTON SITE

insert into ucesbwe.parking_zone (zone_id, caravan_site_id, zone_name, zone_ground_surface_type, zone_energy_type, zone_service_type, location)
values 
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POLYGON((465100 78900 10, 465100 79900 10, 465600 79900 10, 465600 78900 10,  465100 78900 10))',27700))), 'Alpaca', 'hardstanding', 'carlo gas', 'not serviced', st_geomfromtext('POLYGON((465100 78900 10, 465100 79900 10, 465600 79900 10, 465600 78900 10,  465100 78900 10))',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POLYGON((465800 78900 40, 465800 79900 40, 466800 79900 40, 466800 78900 40,  465800 78900 40))',27700))),'Bandicoot', 'grass', 'electricity', 'fully serviced', st_geomfromtext('POLYGON((465800 78900 40, 465800 79900 40, 466800 79900 40, 466800 78900 40,  465800 78900 40))',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POLYGON((465100 77200 70, 465100 78700 70, 467100 78700 70, 467100 77200 70,  465100 77200 70))',27700))), 'Cuscus', 'mixed', 'electricity', 'super serviced', st_geomfromtext('POLYGON((465100 77200 70, 465100 78700 70, 467100 78700 70, 467100 77200 70,  465100 77200 70))',27700));


--==========================
-- PARKING ZONE FOR TIZOL SITE

insert into ucesbwe.parking_zone (zone_id, caravan_site_id, zone_name, zone_ground_surface_type, zone_energy_type, zone_service_type, location)
values 
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POLYGON((469600 76900 170, 469600 78400 170, 471600 78400 170, 471600 76900 170,  469600 76900 170))',27700))), 'Lemur', 'mixed', 'electricity', 'super serviced', st_geomfromtext('POLYGON((469600 76900 170, 469600 78400 170, 471600 78400 170, 471600 76900 170,  469600 76900 170))',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POLYGON((469600 75700 110, 469600 76700 110, 470100 76700 110, 470100 75700 110,  469600 75700 110))',27700))),'Gecko', 'grass', 'self provided', 'not serviced', st_geomfromtext('POLYGON((469600 75700 110, 469600 76700 110, 470100 76700 110, 470100 75700 110,  469600 75700 110))',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POLYGON((470300 75700 140, 470300 76700 140, 471600 76700 140, 471600 75700 140,  470300 75700 140))',27700))), 'Hornbill', 'mixed', 'electricity', 'premium serviced', st_geomfromtext('POLYGON((470300 75700 140, 470300 76700 140, 471600 76700 140, 471600 75700 140,  470300 75700 140))',27700));


--========================================================
-- INSERT INTO PITCHES
--==========================
-- PITCHES FOR ZONE ALPACA

insert into ucesbwe.pitch (pitch_id, zone_id, pitch_number, pitch_ground_surface_type, pitch_size, pitch_energy_supply, location)
values
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465120 79880 20, 465220 79880 20, 465220 79680 20, 465120 79680 20, 465120 79880 20))',27700))), 'A001', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465120 79880 20, 465220 79880 20, 465220 79680 20, 465120 79680 20, 465120 79880 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465240 79880 20, 465340 79880 20, 465340 79680 20, 465240 79680 20, 465240 79880 20))',27700))), 'A002', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465240 79880 20, 465340 79880 20, 465340 79680 20, 465240 79680 20, 465240 79880 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465360 79880 20, 465460 79880 20, 465460 79680 20, 465360 79680 20, 465360 79880 20))',27700))), 'A003', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465360 79880 20, 465460 79880 20, 465460 79680 20, 465360 79680 20, 465360 79880 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465480 79880 20, 465580 79880 20, 465580 79680 20, 465480 79680 20, 465480 79880 20))',27700))), 'A004', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465480 79880 20, 465580 79880 20, 465580 79680 20, 465480 79680 20, 465480 79880 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465120 79660 20, 465220 79660 20, 465220 79460 20, 465120 79460 20, 465120 79660 20))',27700))), 'A005', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465120 79660 20, 465220 79660 20, 465220 79460 20, 465120 79460 20, 465120 79660 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465240 79660 20, 465340 79660 20, 465340 79460 20, 465240 79460 20, 465240 79660 20))',27700))), 'A006', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465240 79660 20, 465340 79660 20, 465340 79460 20, 465240 79460 20, 465240 79660 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465360 79660 20, 465460 79660 20, 465460 79460 20, 465360 79460 20, 465360 79660 20))',27700))), 'A007', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465360 79660 20, 465460 79660 20, 465460 79460 20, 465360 79460 20, 465360 79660 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465480 79660 20, 465580 79660 20, 465580 79460 20, 465480 79460 20, 465480 79660 20))',27700))), 'A008', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465480 79660 20, 465580 79660 20, 465580 79460 20, 465480 79460 20, 465480 79660 20))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((465120 79440 20, 465220 79440 20, 465220 79240 20, 465120 79240 20, 465120 79440 20))',27700))), 'A009', 'hardstanding', 'compact', 'carlo gas', st_geomfromtext('POLYGON((465120 79440 20, 465220 79440 20, 465220 79240 20, 465120 79240 20, 465120 79440 20))',27700));



--==========================
-- PITCHES FOR ZONE BANDICOOT
insert into ucesbwe.pitch (pitch_id, zone_id, pitch_number, pitch_ground_surface_type, pitch_size, pitch_energy_supply, location)
values
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465820 79880 50, 466120 79880 50, 466120 79580 50, 465820 79580 50, 465820 79880 50))',27700))), 'B001', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((465820 79880 50, 466120 79880 50, 466120 79580 50, 465820 79580 50, 465820 79880 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466140 79880 50, 466440 79880 50, 466440 79580 50, 466140 79580 50, 466140 79880 50))',27700))), 'B002', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((466140 79880 50, 466440 79880 50, 466440 79580 50, 466140 79580 50, 466140 79880 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466460 79880 50, 466760 79880 50, 466760 79580 50, 466460 79580 50, 466460 79880 50))',27700))), 'B003', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((466460 79880 50, 466760 79880 50, 466760 79580 50, 466460 79580 50, 466460 79880 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465820 79560 50, 466120 79560 50, 466120 79260 50, 465820 79260 50, 465820 79560 50))',27700))), 'B004', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((465820 79560 50, 466120 79560 50, 466120 79260 50, 465820 79260 50, 465820 79560 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466140 79560 50, 466440 79560 50, 466440 79260 50, 466140 79260 50, 466140 79560 50))',27700))), 'B005', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((466140 79560 50, 466440 79560 50, 466440 79260 50, 466140 79260 50, 466140 79560 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466460 79560 50, 466760 79560 50, 466760 79260 50, 466460 79260 50, 466460 79560 50))',27700))), 'B006', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((466460 79560 50, 466760 79560 50, 466760 79260 50, 466460 79260 50, 466460 79560 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465820 79240 50, 466120 79240 50, 466120 78940 50, 465820 78940 50, 465820 79240 50))',27700))), 'B007', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((465820 79240 50, 466120 79240 50, 466120 78940 50, 465820 78940 50, 465820 79240 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466140 79240 50, 466440 79240 50, 466440 78940 50, 466140 78940 50, 466140 79240 50))',27700))), 'B008', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((466140 79240 50, 466440 79240 50, 466440 78940 50, 466140 78940 50, 466140 79240 50))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466460 79240 50, 466760 79240 50, 466760 78940 50, 466460 78940 50, 466460 79240 50))',27700))), 'B009', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((466460 79240 50, 466760 79240 50, 466760 78940 50, 466460 78940 50, 466460 79240 50))',27700));


--==========================
-- PITCHES FOR ZONE CUSCUS

insert into ucesbwe.pitch (pitch_id, zone_id, pitch_number, pitch_ground_surface_type, pitch_size, pitch_energy_supply, location)
values
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465150 78650 80, 465550 78650 80, 465550 78250 80, 465150 78250 80, 465150 78650 80))',27700))), 'C001', 'grass', 'large', 'electricity', st_geomfromtext('POLYGON((465150 78650 80, 465550 78650 80, 465550 78250 80, 465150 78250 80, 465150 78650 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465600 78650 80, 466000 78650 80, 466000 78250 80, 465600 78250 80, 465600 78650 80))',27700))), 'C002', 'grass', 'large', 'electricity', st_geomfromtext('POLYGON((465600 78650 80, 466000 78650 80, 466000 78250 80, 465600 78250 80, 465600 78650 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466050 78650 80, 466450 78650 80, 466450 78250 80, 466050 78250 80, 466050 78650 80))',27700))), 'C003', 'grass', 'large', 'electricity', st_geomfromtext('POLYGON((466050 78650 80, 466450 78650 80, 466450 78250 80, 466050 78250 80, 466050 78650 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466500 78650 80, 466900 78650 80, 466900 78250 80, 466500 78250 80, 466500 78650 80))',27700))), 'C004', 'hardstanding', 'large', 'electricity', st_geomfromtext('POLYGON((466500 78650 80, 466900 78650 80, 466900 78250 80, 466500 78250 80, 466500 78650 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465150 78200 80, 465550 78200 80, 465550 77800 80, 465150 77800 80, 465150 78200 80))',27700))), 'C005', 'hardstanding', 'large', 'electricity', st_geomfromtext('POLYGON((465150 78200 80, 465550 78200 80, 465550 77800 80, 465150 77800 80, 465150 78200 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465600 78200 80, 466000 78200 80, 466000 77800 80, 465600 77800 80, 465600 78200 80))',27700))), 'C006', 'hardstanding', 'large', 'electricity', st_geomfromtext('POLYGON((465600 78200 80, 466000 78200 80, 466000 77800 80, 465600 77800 80, 465600 78200 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466050 78200 80, 466450 78200 80, 466450 77800 80, 466050 77800 80, 466050 78200 80))',27700))), 'C007', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((466050 78200 80, 466450 78200 80, 466450 77800 80, 466050 77800 80, 466050 78200 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((466500 78200 80, 466900 78200 80, 466900 77800 80, 466500 77800 80, 466500 78200 80))',27700))), 'C008', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((466500 78200 80, 466900 78200 80, 466900 77800 80, 466500 77800 80, 466500 78200 80))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((465150 77750 80, 465550 77750 80, 465550 77350 80, 465150 77350 80, 465150 77750 80))',27700))), 'C009', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((465150 77750 80, 465550 77750 80, 465550 77350 80, 465150 77350 80, 465150 77750 80))',27700));


--==========================
-- PITCHES FOR ZONE LEMUR

insert into ucesbwe.pitch (pitch_id, zone_id, pitch_number, pitch_ground_surface_type, pitch_size, pitch_energy_supply, location)
values
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469650 78350 180, 470050 78350 180, 470050 77950 180, 469650 77950 180, 469650 78350 180))',27700))), 'L001', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((469650 78350 180, 470050 78350 180, 470050 77950 180, 469650 77950 180, 469650 78350 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((470100 78350 180, 470500 78350 180, 470500 77950 180, 470100 77950 180, 470100 78350 180))',27700))), 'L002', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((470100 78350 180, 470500 78350 180, 470500 77950 180, 470100 77950 180, 470100 78350 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((470550 78350 180, 470950 78350 180, 470950 77950 180, 470550 77950 180, 470550 78350 180))',27700))), 'L003', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((470550 78350 180, 470950 78350 180, 470950 77950 180, 470550 77950 180, 470550 78350 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((471000 78350 180, 471400 78350 180, 471400 77950 180, 471000 77950 180, 471000 78350 180))',27700))), 'L004', 'multi-surface', 'large', 'electricity', st_geomfromtext('POLYGON((471000 78350 180, 471400 78350 180, 471400 77950 180, 471000 77950 180, 471000 78350 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469650 77900 180, 470050 77900 180, 470050 77500 180, 469650 77500 180, 469650 77900 180))',27700))), 'L005', 'hardstanding', 'large', 'electricity', st_geomfromtext('POLYGON((469650 77900 180, 470050 77900 180, 470050 77500 180, 469650 77500 180, 469650 77900 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((470100 77900 180, 470500 77900 180, 470500 77500 180, 470100 77500 180, 470100 77900 180))',27700))), 'L006', 'hardstanding', 'large', 'electricity', st_geomfromtext('POLYGON((470100 77900 180, 470500 77900 180, 470500 77500 180, 470100 77500 180, 470100 77900 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((470550 77900 180, 470950 77900 180, 470950 77500 180, 470550 77500 180, 470550 77900 180))',27700))), 'L007', 'hardstanding', 'large', 'electricity', st_geomfromtext('POLYGON((470550 77900 180, 470950 77900 180, 470950 77500 180, 470550 77500 180, 470550 77900 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((471000 77900 180, 471400 77900 180, 471400 77500 180, 471000 77500 180, 471000 77900 180))',27700))), 'L008', 'grass', 'large', 'electricity', st_geomfromtext('POLYGON((471000 77900 180, 471400 77900 180, 471400 77500 180, 471000 77500 180, 471000 77900 180))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((471000 77450 180, 471400 77450 180, 471400 77050 180, 471000 77050 180, 471000 77450 180))',27700))), 'L009', 'grass', 'large', 'electricity', st_geomfromtext('POLYGON((471000 77450 180, 471400 77450 180, 471400 77050 180, 471000 77050 180, 471000 77450 180))',27700));



--==========================
-- PITCHES FOR ZONE GECKO

insert into ucesbwe.pitch (pitch_id, zone_id, pitch_number, pitch_ground_surface_type, pitch_size, pitch_energy_supply, location)
values
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469620 76680 120,469720 76680 120,469720 76480 120,469620 76480 120,469620 76680 120))',27700))), 'G001', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469620 76680 120,469720 76680 120,469720 76480 120,469620 76480 120,469620 76680 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469740 76680 120,469840 76680 120,469840 76480 120,469740 76480 120,469740 76680 120))',27700))), 'G002', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469740 76680 120,469840 76680 120,469840 76480 120,469740 76480 120,469740 76680 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469860 76680 120,469960 76680 120,469960 76480 120,469860 76480 120,469860 76680 120))',27700))), 'G003', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469860 76680 120,469960 76680 120,469960 76480 120,469860 76480 120,469860 76680 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469980 76680 120,470080 76680 120,470080 76480 120,469980 76480 120,469980 76680 120))',27700))), 'G004', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469980 76680 120,470080 76680 120,470080 76480 120,469980 76480 120,469980 76680 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469620 76460 120,469720 76460 120,469720 76260 120,469620 76260 120,469620 76460 120))',27700))), 'G005', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469620 76460 120,469720 76460 120,469720 76260 120,469620 76260 120,469620 76460 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469740 76460 100,469840 76460 120,469840 76260 120,469740 76260 120,469740 76460 120))',27700))), 'G006', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469740 76460 100,469840 76460 120,469840 76260 120,469740 76260 120,469740 76460 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469860 76460 100,469960 76460 120,469960 76260 120,469860 76260 120,469860 76460 120))',27700))), 'G007', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469860 76460 100,469960 76460 120,469960 76260 120,469860 76260 120,469860 76460 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469980 76460 100,470080 76460 120,470080 76260 120,469980 76260 120,469980 76460 120))',27700))), 'G008', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469980 76460 100,470080 76460 120,470080 76260 120,469980 76260 120,469980 76460 120))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location, st_geomfromtext('POLYGON((469620 76240 100,469720 76240 120,469720 76040 120,469620 76040 120,469620 76240 120))',27700))), 'G009', 'grass', 'compact', 'self provided', st_geomfromtext('POLYGON((469620 76240 100,469720 76240 120,469720 76040 120,469620 76040 120,469620 76240 120))',27700));



--==========================
-- PITCHES FOR ZONE HORNBILL

insert into ucesbwe.pitch (pitch_id, zone_id, pitch_number, pitch_ground_surface_type, pitch_size, pitch_energy_supply, location)
values
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((470370 76680 150,470670 76680 150,470670 76380 150,470370 76380 150,470370 76680 150))',27700))), 'H001', 'multi-surface', 'standard', 'electricity', st_geomfromtext('POLYGON((470370 76680 150,470670 76680 150,470670 76380 150,470370 76380 150,470370 76680 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((470690 76680 150,470990 76680 150,470990 76380 150,470690 76380 150,470690 76680 150))',27700))), 'H002', 'multi-surface', 'standard', 'electricity', st_geomfromtext('POLYGON((470690 76680 150,470990 76680 150,470990 76380 150,470690 76380 150,470690 76680 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((471010 76680 150,471310 76680 150,471310 76380 150,471010 76380 150,471010 76680 150))',27700))), 'H003', 'multi-surface', 'standard', 'electricity', st_geomfromtext('POLYGON((471010 76680 150,471310 76680 150,471310 76380 150,471010 76380 150,471010 76680 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((470370 76360 150,470670 76360 150,470670 76060 150,470370 76060 150,470370 76360 150))',27700))), 'H004', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((470370 76360 150,470670 76360 150,470670 76060 150,470370 76060 150,470370 76360 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((470690 76360 150,470990 76360 150,470990 76060 150,470690 76060 150,470690 76360 150))',27700))), 'H005', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((470690 76360 150,470990 76360 150,470990 76060 150,470690 76060 150,470690 76360 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((471010 76360 150,471310 76360 150,471310 76060 150,471010 76060 150,471010 76360 150))',27700))), 'H006', 'grass', 'standard', 'electricity', st_geomfromtext('POLYGON((471010 76360 150,471310 76360 150,471310 76060 150,471010 76060 150,471010 76360 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((470370 76040 150,470670 76040 150,470670 75740 150,470370 75740 150,470370 76040 150))',27700))), 'H007', 'hardstanding', 'standard', 'electricity', st_geomfromtext('POLYGON((470370 76040 150,470670 76040 150,470670 75740 150,470370 75740 150,470370 76040 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((470690 76040 150,470990 76040 150,470990 75740 150,470690 75740 150,470690 76040 150))',27700))), 'H008', 'hardstanding', 'standard', 'electricity', st_geomfromtext('POLYGON((470690 76040 150,470990 76040 150,470990 75740 150,470690 75740 150,470690 76040 150))',27700)),
(Default, (select zone_id from ucesbwe.parking_zone where st_contains(location,st_geomfromtext('POLYGON((471010 76040 150,471310 76040 150,471310 75740 150,471010 75740 150,471010 76040 150))',27700))), 'H009', 'hardstanding', 'standard', 'electricity', st_geomfromtext('POLYGON((471010 76040 150,471310 76040 150,471310 75740 150,471010 75740 150,471010 76040 150))',27700));



--========================================================
-- INSERT INTO ON_SITE_FACILITIES
--===============================
-- INSERT FACILITIES FOR ELLINGTON SITE 

insert into ucesbwe.on_site_facilities(on_site_facility_id, caravan_site_id, on_site_facility_name, on_site_facility_type, location)
values
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POINT(467200 78800 0)',27700))), 'vendor machine 1', 'convenience', st_geomfromtext('POINT(467200 78800 0)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POINT(466900 79900 0)',27700))), 'vendor machine 2', 'convenience', st_geomfromtext('POINT(466900 79900 0)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POINT(465700 79900 0)',27700))), 'fire hydrant 1', 'safety', st_geomfromtext('POINT(465700 79900 0)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POINT(466000 78800 0)',27700))), 'fire hydrant 2', 'safety', st_geomfromtext('POINT(466000 78800 0)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POINT(465100 77150 0)',27700))), 'water fountain 1', 'convenience', st_geomfromtext('POINT(465100 77150 0)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location, st_geomfromtext('POINT(466800 78800 0)',27700))), 'water fountain 2', 'convenience', st_geomfromtext('POINT(466800 78800 0)',27700));


--===============================
-- INSERT FACILITIES FOR TIZOL SITE 

insert into ucesbwe.on_site_facilities(on_site_facility_id, caravan_site_id, on_site_facility_name, on_site_facility_type, location)
values
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POINT(471000 75650 100)',27700))), 'fire hydrant 3', 'safety', st_geomfromtext('POINT(471000 75650 100)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POINT(470150 76850 100)',27700))), 'fire hydrant 4', 'safety', st_geomfromtext('POINT(470150 76850 100)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POINT(470400 76850 100)',27700))), 'vendor machine 3', 'convenience', st_geomfromtext('POINT(470400 76850 100)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POINT(469550 75700 100)',27700))), 'vendor machine 4', 'convenience', st_geomfromtext('POINT(469550 77300 100)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POINT(471650 75750 100)',27700))), 'water fountain 3', 'convenience', st_geomfromtext('POINT(471650 75750 100)',27700)),
(Default, (select caravan_site_id from ucesbwe.caravan_site where st_3dintersects(location,st_geomfromtext('POINT(471150 75650 100)',27700))), 'water fountain 4', 'convenience', st_geomfromtext('POINT(471150 75650 100)',27700));




--========================================================
-- INSERT INTO FACILITIY STATUS
--==============
-- INSERT INTO CARAVAN SITE FACILITY STATUS

insert into ucesbwe.caravan_site_facility_status (caravan_site_facility_status_id, caravan_site_id, on_site_vendor_machine, on_site_fire_hydrant, on_site_water_fountain, on_site_cctv, on_site_toilet, status_check_month)

values

(Default, (select caravan_site_id from ucesbwe.caravan_site where caravan_site_name = 'Ellington site'), 2, 2, 2, 2, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select caravan_site_id from ucesbwe.caravan_site where caravan_site_name = 'Tizol site'), 2, 2, 2, 2, 2, date_trunc('month', timestamp '2022-12-01'));



--==============
-- INSERT INTO PITCH FACILITY STATUS

insert into ucesbwe.pitch_facility_status (pitch_facility_status_id, pitch_id, on_pitch_drinkingwater, on_pitch_greywater, on_pitch_charging_hook, on_pitch_bbq_stand, on_pitch_awning, on_pitch_privacy_hedge, on_pitch_tv_aerial_outlet, status_check_month)

values

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 4, 3, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 4, 3, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 4, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 2, 1, 2, 3, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 2, 1, 2, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 2, 3, 2, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 2, 1, 2, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 2, 1, 2, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 2, 1, 3, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 2, 1, 2, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 2, 1, 2, 2, 1, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 2, 1, 2, 2, 3, 4, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 1, 1, 1, 1, 1, 3, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 1, 1, 1, 1, 1, 1, 3, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 3, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 3, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 2, 2, 4, 4, 4, 4, 4, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 2, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 3, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 2, 1, 2, 2, 3, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 2, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 2, 1, 3, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 2, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 2, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 2, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 2, 1, 2, 2, 1, 1, 2, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 1, 1, 3, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 1, 1, 1, 1, 1, 1, 3, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01')),
(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 1, 1, 1, 1, 1, 1, 1, date_trunc('month', timestamp '2022-12-01'));




--==================================================================================================================================
--========================
-- INSERT INTO PITCH_TYPE

Insert into ucesbwe.pitch_types(pitch_type_id, zone_id, pitch_type)
Values
(Default, (select zone_id from ucesbwe.parking_zone where zone_name = 'Alpaca'), 'economic_pitch'),
(Default, (select zone_id from ucesbwe.parking_zone where zone_name = 'Bandicoot'), 'premium_pitch'),
(Default, (select zone_id from ucesbwe.parking_zone where zone_name = 'Cuscus'), 'luxury_pitch'),
(Default, (select zone_id from ucesbwe.parking_zone where zone_name = 'Gecko'), 'economic_pitch'),
(Default, (select zone_id from ucesbwe.parking_zone where zone_name = 'Hornbill'), 'premium_pitch'),
(Default, (select zone_id from ucesbwe.parking_zone where zone_name = 'Lemur'), 'luxury_pitch');












--==================================================================================================================================
--===================================================
-- INSERT INTO VISITED_TIMES_REPORT

Insert into ucesbwe.visited_times_report(visited_times_report_id, pitch_id, visited_times_per_month, month)

values

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 7, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 8, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 16, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 8, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 19, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 11, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 11, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 10, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 5, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 16, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 2, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A001'), 11, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 9, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 15, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 12, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 13, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 3, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 15, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 9, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 9, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 7, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 17, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 20, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A002'), 11, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 10, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 3, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 19, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 6, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 7, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 18, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 3, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 19, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 1, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 12, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A003'), 11, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 12, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 2, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 5, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 9, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 1, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 3, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 11, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 14, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 15, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 3, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 9, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A004'), 1, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 15, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 15, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 13, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 15, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 10, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 4, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 6, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 2, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 13, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 9, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 11, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A005'), 2, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 18, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 1, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 7, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 10, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 2, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 4, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 3, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 15, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 5, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 11, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 4, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A006'), 20, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 4, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 1, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 1, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 13, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 5, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 16, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 13, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 5, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 18, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 18, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 8, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A007'), 18, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 17, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 7, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 13, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 20, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 1, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 7, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 11, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 9, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 4, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 12, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 15, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A008'), 20, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 1, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 2, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 9, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 18, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 19, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 15, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 18, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 17, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 8, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 20, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'A009'), 9, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 11, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 17, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 9, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 16, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 12, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 18, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 15, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 10, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 19, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 20, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 14, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B001'), 4, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 15, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 14, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 4, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 1, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 16, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 12, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 2, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 16, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 18, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 4, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B002'), 11, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 3, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 6, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 16, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 15, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 15, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 5, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 7, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 20, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 15, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 16, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B003'), 10, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 10, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 10, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 4, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 12, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 5, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 5, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 13, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 10, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 8, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 14, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B004'), 15, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 10, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 1, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 15, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 17, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 10, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 5, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 4, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 8, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 20, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 2, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 9, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B005'), 13, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 5, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 16, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 2, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 5, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 1, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 9, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 12, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 7, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 12, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 2, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 18, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B006'), 1, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 14, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 6, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 16, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 6, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 6, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 5, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 7, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 8, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 17, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 12, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 12, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B007'), 11, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 16, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 3, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 13, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 9, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 2, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 16, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 2, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 19, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 16, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 17, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B008'), 13, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 18, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 10, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 4, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 5, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 17, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 11, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 17, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 11, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 18, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 12, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 14, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'B009'), 9, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 19, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 9, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 16, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 12, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 4, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 5, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 20, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 2, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 10, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 19, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 13, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C001'), 18, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 8, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 8, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 19, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 16, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 17, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 14, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 6, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 17, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 7, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 12, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C002'), 15, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 4, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 11, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 5, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 9, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 4, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 8, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 7, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 8, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 18, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 14, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C003'), 11, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 16, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 8, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 4, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 4, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 13, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 9, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 12, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 18, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 1, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 15, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C004'), 8, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 5, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 16, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 5, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 6, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 1, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 14, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 9, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 17, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 2, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 12, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 11, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C005'), 2, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 17, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 6, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 17, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 15, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 14, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 3, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 1, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 3, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 3, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 18, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 4, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C006'), 8, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 5, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 14, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 5, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 13, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 20, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 10, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 14, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 7, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 2, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 15, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 18, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C007'), 20, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 19, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 14, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 4, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 18, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 14, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 11, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 1, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 17, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 9, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 17, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 17, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C008'), 9, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 9, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 4, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 4, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 12, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 2, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 4, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 7, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 10, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 15, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 19, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 14, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'C009'), 3, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 8, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 14, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 16, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 3, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 18, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 1, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 6, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 11, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 2, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 18, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 9, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G001'), 12, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 18, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 4, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 1, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 8, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 6, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 7, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 6, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 16, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 18, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 2, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 15, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G002'), 14, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 11, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 6, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 6, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 17, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 19, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 12, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 13, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 17, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 20, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 17, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 17, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G003'), 14, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 17, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 6, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 5, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 8, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 5, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 14, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 6, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 17, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 11, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 1, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 11, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G004'), 1, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 7, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 20, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 13, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 18, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 4, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 18, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 7, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 14, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 4, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 10, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 18, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G005'), 5, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 8, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 3, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 9, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 7, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 2, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 10, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 14, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 12, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 20, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 2, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 7, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G006'), 6, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 8, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 10, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 12, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 6, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 18, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 20, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 11, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 15, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 2, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 19, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 11, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G007'), 5, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 18, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 8, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 14, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 7, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 19, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 17, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 8, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 9, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 2, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 9, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 16, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G008'), 19, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 12, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 15, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 4, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 13, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 18, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 4, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 15, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 4, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 20, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 7, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'G009'), 5, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 4, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 12, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 14, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 2, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 3, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 17, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 16, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 5, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 16, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 6, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 9, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H001'), 5, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 8, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 3, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 15, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 3, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 6, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 14, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 13, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 17, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 2, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 19, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 18, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H002'), 12, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 4, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 4, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 12, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 10, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 1, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 15, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 9, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 12, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 6, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 17, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H003'), 16, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 3, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 10, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 2, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 10, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 6, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 9, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 5, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 12, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 3, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 15, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 5, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H004'), 10, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 8, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 2, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 3, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 8, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 2, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 2, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 18, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 2, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 6, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 12, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 12, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H005'), 10, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 19, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 14, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 12, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 7, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 18, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 5, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 18, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 19, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 14, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 9, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 3, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H006'), 2, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 13, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 4, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 19, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 11, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 2, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 12, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 12, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 12, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 1, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 7, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 9, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H007'), 17, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 10, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 17, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 14, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 19, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 4, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 16, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 16, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 13, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 6, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 5, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 1, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H008'), 2, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 10, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 3, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 11, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 6, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 10, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 1, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 17, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 15, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 17, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 19, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 14, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'H009'), 2, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 8, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 8, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 6, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 16, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 12, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 10, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 18, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 11, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 13, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 20, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 3, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L001'), 4, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 12, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 8, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 13, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 12, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 8, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 10, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 20, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 16, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 6, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 20, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 19, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L002'), 10, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 3, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 6, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 6, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 14, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 3, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 8, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 6, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 20, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 9, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 19, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 20, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L003'), 8, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 18, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 5, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 7, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 3, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 15, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 14, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 8, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 19, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 11, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 17, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 13, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L004'), 5, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 6, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 6, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 1, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 9, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 20, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 5, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 14, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 15, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 3, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 20, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L005'), 4, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 9, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 11, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 18, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 2, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 3, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 15, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 10, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 7, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 5, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 7, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 1, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L006'), 20, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 5, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 5, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 14, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 6, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 8, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 17, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 20, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 3, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 14, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 12, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 1, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L007'), 1, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 7, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 15, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 1, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 9, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 19, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 16, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 20, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 15, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 3, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 6, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 2, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L008'), 10, date_trunc('month', timestamp '2022-12-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 7, date_trunc('month', timestamp '2022-01-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 13, date_trunc('month', timestamp '2022-02-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 3, date_trunc('month', timestamp '2022-03-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 4, date_trunc('month', timestamp '2022-04-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 13, date_trunc('month', timestamp '2022-05-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 19, date_trunc('month', timestamp '2022-06-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 7, date_trunc('month', timestamp '2022-07-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 17, date_trunc('month', timestamp '2022-08-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 17, date_trunc('month', timestamp '2022-09-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 3, date_trunc('month', timestamp '2022-10-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 8, date_trunc('month', timestamp '2022-11-01')),

(Default, (select pitch_id from ucesbwe.pitch where pitch_number = 'L009'), 11, date_trunc('month', timestamp '2022-12-01'));


