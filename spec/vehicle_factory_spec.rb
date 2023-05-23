require 'spec_helper'

RSpec.describe Registrant do
  
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  or_ev_registrations = DmvDataService.new.or_dmv_office_locations
 

  describe '#VehicleFactory' do
   factory = VehicleFactory.new
   
   it "create_vehicles" do
    expect(wa_ev_registrations.count).to eq(1000)
    expect(factory.create_vehicles(wa_ev_registrations)).to be_an_instance_of(Array)
    expect((factory.create_vehicles(wa_ev_registrations)).count).to eq(1000)

   end

  end
end