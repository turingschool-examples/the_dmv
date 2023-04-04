require 'spec_helper'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.describe FacilityFactory do
  it 'exists' do
    office = FacilityFactory.new 
  
    expect(office).to be_an_instance_of(FacilityFactory)
  end

  describe 'oregon_offices' do
    it 'has oregon office info' do
      office = FacilityFactory.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      office = office.checks_location(or_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(59)
    end
  end
  
  describe 'ny_offices' do
    it 'has ny office info' do
      office = FacilityFactory.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      office = office.checks_location(ny_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(170)
    end
  end

  describe 'mo_offices' do
    it 'has mo office info' do
      office = FacilityFactory.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      office = office.checks_location(mo_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(177)
    end
  end   



end