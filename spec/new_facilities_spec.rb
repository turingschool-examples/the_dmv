require 'spec_helper'

RSpec.describe NewFacilities do
  
  new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  or_ev_registrations = DmvDataService.new.or_dmv_office_locations
 

  describe '#VehicleFactory' do
  new_facilities = NewFacilities.new
   
   xit "new_york_facilities" do
    expect(new_york_facilities.count).to eq(172)
    expect(new_facilities.create_facilities(new_york_facilities)).to be_an_instance_of(Array)
    expect((new_facilities.create_facilities(new_york_facilities)).count).to eq(172)
   end

   xit "missouri_facilities" do
    expect(missouri_facilities.count).to eq(178)
    expect(new_facilities.create_facilities(missouri_facilities)).to be_an_instance_of(Array)
    expect((new_facilities.create_facilities(missouri_facilities)).count).to eq(178)
   end

   it "or_ev_registrations" do
    expect(or_ev_registrations.count).to eq(59)
    expect(new_facilities.create_facilities(or_ev_registrations)).to be_an_instance_of(Array)
    expect((new_facilities.create_facilities(or_ev_registrations)).count).to eq(59)
   end

  end
end