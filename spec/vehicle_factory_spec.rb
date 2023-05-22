require 'spec_helper'

RSpec.describe Registrant do
 

  describe '#initialize' do
   factory = VehicleFactory.new
   wa_ev_registrations = DmvDataService.new.wa_ev_registrations
   new_york_facilities = DmvDataService.new.ny_dmv_office_locations
   missouri_facilities = DmvDataService.new.mo_dmv_office_locations
   or_ev_registrations = DmvDataService.new.or_dmv_office_locations
   p factory.create_vehicles(or_ev_registrations)
  end
end