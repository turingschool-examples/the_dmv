# The DMV

## Description
- This is a program created to manage the services that the DMV offers and to process external data through an API.
- This project starts with taking an existing codebase, fixing bugs/issues, sorting through inefficiencies in the code, and adding new features.
## Existing Funtionality
### Class - Dmv
- DMV objects containing list of facilities
- Allows filtering by service
- Stores DMV facilities in an array
- One state attribute, @facilities
- Tests in spec files done by expected return equality
#### method - add_facility(facility)
- Accepts one argument, a facility to add
- Adds an instance of a Facility to @facilities storage array
#### method - facilities_offering_service(service)
- Accepts one argument, a service to filter from @services from each instance of facility
- Returns the FIRST facility that includes the service in @facilities
- Might need to be fixed as enumerator returns first one, while test returns array of valid facility instances
### Class - Facilities
- Facility objects containing information about facilities
- Allows addition of services to a specific facility
- Four state attributes: @name, @address, @phone, @services
- Tests calling these values, and @services array
#### method - add_service(service)
- Accepts one argument, a service to add to @services array to an instance of Facility
### Class - Vehicle
- Vehicle objects containing information about vehicles
- Five state attributes: @vin, @year, @make, @model, @engine
- Tests the attributes calling and vehicle type determination for antiques and EV
#### method - antique?
- Returns a boolean, true: if vehicle is older than 25 years
- Aquires current date during instance creation
- calculates age based on @year of creation
#### method - electric_vehicle?
- Returns a boolean, true: if vehicle is an ev
### Class - DmvDataService
- Gets data from external data sources
- Tests in spec files done by expected datatype
#### Method - load_data
- Loads data in an array
#### Method - wa_ev_registrations
#### Method - co_dmv_office_locations
#### Method - ny_dmv_office_locations
#### Method - mo_dmv_office_locations
## Added Functionality
## Possible Improvements

## Contributors
- Turing (existing codebase)
- Sam Tran
## Resource(s)
