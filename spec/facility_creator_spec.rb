require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

creator = FacilityCreator.new
co_dmv_registrations = [] 
co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[0]
co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[1]
co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[2]
check_results = creator.create_facility(co_dmv_registrations)

creator = FacilityCreator.new
co_dmv_registrations = DmvDataService.new.co_dmv_office_locations
co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[1]
co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[2]
check_results = creator.create_facility(co_dmv_registrations)