--=====================
  
-- This file contains the constraints for the Buddy's Caravan Site database

-- There are 4 types of constraints in this file
-- 1. Primary keys
-- 2. Foreign keys
-- 3. Unique constraints
-- 4. Check constraints


--=====================
--=====================
-- 1. ADDING PRIMARY KEY

Alter table ucesbwe.caravan_site add constraint caravan_site_pk primary key (caravan_site_id);
Alter table ucesbwe.parking_zone add constraint parking_zone_pk primary key (zone_id);
Alter table ucesbwe.pitch add constraint pitch_pk primary key (pitch_id);
Alter table ucesbwe.on_site_facilities add constraint on_site_facilities_pk primary key (on_site_facility_id);


Alter table ucesbwe.caravan_site_facility_status add constraint caravan_site_facility_status_pk primary key (caravan_site_facility_status_id);
Alter table ucesbwe.pitch_facility_status add constraint pitch_facility_status_pk primary key (pitch_facility_status_id);
Alter table ucesbwe.facility_status_indicator add constraint facility_status_indicator_pk primary key (facility_status_indicator_id);

Alter table ucesbwe.pitch_types add constraint pitch_types_pk primary key (pitch_type_id);

Alter table ucesbwe.visited_times_report add constraint visited_times_report_pk primary key (visited_times_report_id);

Alter table ucesbwe.parameter add constraint parameter_pk primary key (parameter_id);


--=======================
-- 2. ADDING FOREIGN KEYS

-- TABLE PARKING_ZONE
Alter table ucesbwe.parking_zone 
add constraint parking_zone_fk 
foreign key (caravan_site_id) references
Ucesbwe.caravan_site(caravan_site_id);

-- TABLE PITCH
Alter table ucesbwe.pitch
Add constraint pitch_fk
Foreign key (zone_id) references
Ucesbwe.parking_zone(zone_id);


-- TABLE ON_SITE_FACILITIES
Alter table ucesbwe.on_site_facilities
add constraint on_site_facilities_fk
Foreign key (caravan_site_id) references
Ucesbwe.caravan_site(caravan_site_id);



-- TABLE CARAVAN_SITE_FACILITY_STATUS

alter table ucesbwe.caravan_site_facility_status
Add constraint caravan_site_facility_status_caravan_site_fk
Foreign key (caravan_site_id) references
Ucesbwe.caravan_site(caravan_site_id);

alter table ucesbwe.caravan_site_facility_status
Add constraint caravan_site_facility_status_vendor_machine_fk
Foreign key (on_site_vendor_machine) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);


alter table ucesbwe.caravan_site_facility_status
Add constraint caravan_site_facility_status_fire_hydrant_fk
Foreign key (on_site_fire_hydrant) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.caravan_site_facility_status
Add constraint caravan_site_facility_status_water_fountain_fk
Foreign key (on_site_water_fountain) references 
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.caravan_site_facility_status
Add constraint caravan_site_facility_status_cctv_fk
Foreign key (on_site_cctv) references 
Ucesbwe.facility_status_indicator(facility_status_indicator_id);



-- TABLE PTICH_FACILITY_STATUS

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_pitch_id_fk
Foreign key (pitch_id) references
Ucesbwe.pitch(pitch_id);

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_drinkingwater_fk
Foreign key (on_pitch_drinkingwater) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_greywater_fk
Foreign key (on_pitch_greywater) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_charging_hook_fk
Foreign key (on_pitch_charging_hook) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_bbq_stand_fk
Foreign key (on_pitch_bbq_stand) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_awning_fk
Foreign key (on_pitch_awning) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);

alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_privacy_hedge_fk
Foreign key (on_pitch_privacy_hedge) references
Ucesbwe.facility_status_indicator(facility_status_indicator_id);


-- TABLE PITCH_TYEPS

Alter table ucesbwe.pitch_types
Add constraint pitch_types_zone_name_fk
Foreign key (zone_id) references
Ucesbwe.parking_zone(zone_id);

-- TABLE VISITED_TIMES_REPORT

alter table ucesbwe.visited_times_report
add constraint visited_times_report_pitch_id_fk
Foreign key (pitch_id) references
Ucesbwe.pitch(pitch_id);

--=======================
-- 3. ADDING UNIQUE CONSTRAINTS

-- TABLE CARAVAN_SITE UNIQUE CONSTRAINTS

alter table ucesbwe.caravan_site 
Add constraint caravan_site_unique
Unique(caravan_site_name, location);

-- TABLE PARKING_ZONE UNIQUE CONSTRAINTS

Alter table ucesbwe.parking_zone 
Add constraint parking_zone_unique
Unique(location, zone_name);

-- TABLE PITCH UNIQUE CONSTRAINTS

Alter table ucesbwe.pitch 
Add constraint pitch_unique
Unique(location, pitch_number);


-- TABLE ON_SITE_FACILITIES UNIQUE CONSTRAINTS

Alter table ucesbwe.on_site_facilities
Add constraint on_site_facilities_unique
Unique(on_site_facility_name);


-- TABLE CARAVAN_SITE_FACILITY_STATUS UNIQUE CONSTRAINTS

Alter table ucesbwe.caravan_site_facility_status
Add constraint caravan_site_facility_status_unique
Unique(caravan_site_id);


-- TABLE PITCH_FACILITY_STATUS UNIQUE CONSTRAINTS

Alter table ucesbwe.pitch_facility_status
Add constraint pitch_facility_status_unique
Unique(pitch_id);


-- TABLE FACILITY_STATUS_INDICATOR UNIQUE CONSTRAINTS

Alter table ucesbwe.facility_status_indicator
Add constraint facility_status_description_unique
Unique(facility_status_indicator_description);

-- TABLE PITCH_TYPES UNIQUE CONSTRAINTS

Alter table ucesbwe.pitch_types
Add constraint pitch_types_unique
Unique(zone_id, pitch_type);


-- THE VISITED_TIMES_REPORT_TABLE
alter table ucesbwe.visited_times_report
add constraint visited_times_report_unique
Unique (pitch_id, month);


-- TABLE PARAMETER UNIQUE CONSTRAINTS

Alter table ucesbwe.parameter 
Add constraint parameter_unique
Unique(parameter_type, parameter_item_category, parameter_item_name, date_created);



--=======================
-- 4. ADDING CHECK CONSTRAINTS

-- THE PARKING_ZONE TABLE CHECK

Alter table ucesbwe.parking_zone
Add constraint zone_ground_type_check check(zone_ground_surface_type in ('grass','hardstanding','mixed'));

-- THE PITCH TABLE CHECK

Alter table ucesbwe.pitch
Add constraint pitch_ground_surface_type_check check(pitch_ground_surface_type in ('grass','hardstanding','multi-surface')),
Add constraint pitch_size_check check(pitch_size in ('large','standard','compact'));














