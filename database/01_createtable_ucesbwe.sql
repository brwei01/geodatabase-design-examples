
-- 1. DROP AND CREATE SCHEMA

-- CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS postgis_sfcgal;
-- SELECT PostGIS_Full_Version(); # to check PostGIS version
drop schema if exists ucesbwe cascade;
create schema ucesbwe;

--===================================================================================
--===================================================================================

-- 2. CREATE GEOMETRY TABLES 
-- create the 'caravan_site' GEOMETRY table 

drop table if exists ucesbwe.caravan_site;
create table ucesbwe.caravan_site(
	caravan_site_id serial,
	caravan_site_name varchar(100) not null,
	operator_name varchar(100)
	);

-- add the geometry column --3D volume 
select AddGeometryColumn('ucesbwe','caravan_site','location', 27700, 'geometry', 3);

--===================================================================================
-- create the 'parking_zone' GEOMETRY table 

drop table if exists ucesbwe.parking_zone;
create table ucesbwe.parking_zone (
	zone_id serial,
	caravan_site_id int not null,
	zone_name varchar(50),
	zone_ground_surface_type varchar(50) not null,
	zone_energy_type varchar(50) not null,
	zone_service_type varchar(50) not null
	);

-- add the geometry column 3D polygon
select AddGeometryColumn('ucesbwe','parking_zone','location', 27700, 'polygon', 3);

--===================================================================================

-- create the 'pitch' GEOMETRY table 

drop table if exists ucesbwe.pitch;
create table ucesbwe.pitch(
	pitch_id serial,
	zone_id int,
	pitch_number varchar(50) not null,
	pitch_ground_surface_type varchar(50) not null,
	pitch_size varchar(50) not null,
	pitch_energy_supply varchar(50) not null	
	);

-- add the geometry column 3D polygon 
select AddGeometryColumn('ucesbwe','pitch','location', 27700, 'polygon', 3);

--===================================================================================

-- create the 'on_site_facilities' GEOMETRY table 

drop table if exists ucesbwe.on_site_facilities;
create table ucesbwe.on_site_facilities (
	on_site_facility_id serial,
	caravan_site_id int not null,
	on_site_facility_name varchar(50) not null,
	on_site_facility_type varchar(50) not null
	);

-- add the geometry column 3D point 
select AddGeometryColumn('ucesbwe','on_site_facilities','location', 27700, 'point', 3);


--===================================================================================
--===================================================================================

-- 3. CREATE THE FACILITY STATUS TABLES

-- create the 'caravan_site_facility_status' CONDITION table

drop table if exists ucesbwe.caravan_site_facility_status;
create table ucesbwe.caravan_site_facility_status (
	caravan_site_facility_status_id serial,
	caravan_site_id int not null,
	on_site_vendor_machine int not null,
	on_site_fire_hydrant int not null,
	on_site_water_fountain int not null,
	on_site_cctv int not null,
	on_site_toilet int not null,
	status_check_month date
	);

--===================================================================================

-- create the 'pitch_facility_status' CONDITION table

drop table if exists ucesbwe.pitch_facility_status;
create table ucesbwe.pitch_facility_status (
	pitch_facility_status_id serial,
	pitch_id int not null,
	on_pitch_drinkingwater int not null,
	on_pitch_greywater int not null,
	on_pitch_charging_hook int not null,
	on_pitch_bbq_stand int not null,
	on_pitch_awning int not null,
	on_pitch_privacy_hedge int not null,
	on_pitch_TV_aerial_outlet int not null,
	status_check_month date
	);


--===================================================================================
--===================================================================================

-- 4.CREATE FACILITY_STATUS_INDICATOR LOOKUP

drop table if exists ucesbwe.facility_status_indicator;
create table ucesbwe.facility_status_indicator (
	facility_status_indicator_id serial,
	facility_status_indicator_description varchar(50) not null
	);



--===================================================================================
--===================================================================================

-- 5.CREATE VISITED_TIMES_REPORT

drop table if exists ucesbwe.visited_times_report;
create table ucesbwe.visited_times_report(
	visited_times_report_id serial,
	pitch_id int not null,
	visited_times_per_month int not null,
	month date not null
	);


--===================================================================================
--===================================================================================
-- 6. CREATE PITCH TYPE LOOKUP

Drop table if exists ucesbwe.pitch_types;
Create table ucesbwe.pitch_types(
	pitch_type_id serial,
	zone_id int not null,
	pitch_type varchar(50) not null
	);

--===================================================================================
--===================================================================================

-- 7.CREATE THE PARAMETER TABLE

drop table if exists ucesbwe.parameter;
create table ucesbwe.parameter (
	parameter_id serial,
	parameter_type varchar(100) not null,
	parameter_item_category varchar(100) not null,
	parameter_item_name varchar(100) not null,
	parameter_value double precision not null,
	parameter_unit varchar(100) not null,
	date_created date default current_date
	);





