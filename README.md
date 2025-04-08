# The DMV

This is the starter repo for the BE Mod1 DMV project.

# Iteration 1 

- All tests passing.
- Branched and merged.
    - registrant class 
    - name, age, permit-default false

# Iteration 2

## register a vehicle
## rules
- The DMV allows facilities to perform the following services:
    - Register a vehicle
        - Vehicles have the following rules:
            - Vehicles 25 years old or older are considered antique and cost $25 to register
            - Electric Vehicles (EV) cost $200 to register
            - All other vehicles cost $100 to register
            - A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
    - Administer a written test
        - A written test can only be administered to registrants with a permit and who are at least 16 years of age
    - Administer a road test
        - A road test can only be administered to registrants who have passed the written test
        - For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
    - Renew a driver’s license
        - A license can only be renewed if the registrant has already passed the road test and earned a license

- facility.registered_vehicles  X
- facility.collected_fees       X
- facility.register_vehicle     X
- vehicle.registraation_date    X
- vehicle.plate_type            X

## getting a license

- facility.administer_written_test(arg) X
    - check for service/age/permit      X
- facility.administer_road_test(arg)    X
    - check for written test/service    X
- facility.renew_drivers_license(arg)   X
    - renew if licence is true          X

## using api

- DmvDataService.new.wa_ev_registrations    x
    - factory.create_vehicles               x

## iteration3
- DmvDataService.new.co_dmv_office_locations    x
    - dmv.co_facilities                         x
- DmvDataService.new.ny_dmv_office_locations    x
    - dmv.ny_facilities                         x
- DmvDataService.new.mo_dmv_office_locations    x
    - dmv.mo_facilities                         x

