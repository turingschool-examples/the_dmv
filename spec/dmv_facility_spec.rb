require 'spec_helper'

RSpec.describe DmvFacility do
  before(:each) do
    @oregon_facilities = DmvFacility.new
    @ny_facilities = DmvFacility.new
    @mo_facilities = DmvFacility.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  describe 'exist' do
    it 'can exist' do
      expect(@oregon_facilities).to be_a(DmvFacility)
    end
  end

  describe '#create_facility(locations)' do
    it 'can create facility locations' do
      @oregon_facilities.create_facility_or(@or_dmv_office_locations)
      expect(@oregon_facilities.create_facility_or(@or_dmv_office_locations)).to be_an(Array)
      expect(@oregon_facilities.create_facility_or(@or_dmv_office_locations)[0]).to be_a(Facility)
      expect(@oregon_facilities.create_facility_or(@or_dmv_office_locations)[0].address).to be_a(String)

      @ny_facilities.create_facility_ny(@ny_dmv_office_locations)
      expect(@ny_facilities.create_facility_ny(@ny_dmv_office_locations)).to be_an(Array)
      expect(@ny_facilities.create_facility_ny(@ny_dmv_office_locations)[0]).to be_a(Facility)
      expect(@ny_facilities.create_facility_ny(@ny_dmv_office_locations)[0].address).to be_a(String)

      @mo_facilities.create_facility_mo(@mo_dmv_office_locations)
      expect(@mo_facilities.create_facility_mo(@mo_dmv_office_locations)).to be_an(Array)
      expect(@mo_facilities.create_facility_mo(@mo_dmv_office_locations)[0]).to be_a(Facility)
      expect(@mo_facilities.create_facility_mo(@mo_dmv_office_locations)[0].address).to be_a(String)
    end
  end
end