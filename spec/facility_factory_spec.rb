require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
  end

  describe '#initialize' do
    it 'can itilialize' do
      @facility_factory = FacilityFactory.new

      expect(@facility_factory).to be_an_instance_of(FacilityFactory)
      expect(@facility_factory.facilities).to eq([])
    end
  end

  describe '#create_or_facilities' do
    it 'can create and store facilities' do
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

      @facility_factory.create_or_facilities(or_dmv_office_locations)

      expect(@facility_factory.facilities).to be_a(Array)
      expect(@facility_factory.facilities[0]).to be_an_instance_of(Facility)
    end
  end

  describe '#create_ny_facilities' do
    it 'can create and store facilities' do
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations

      @facility_factory.create_ny_facilities(ny_dmv_office_locations)

      expect(@facility_factory.facilities).to be_a(Array)
      expect(@facility_factory.facilities[0]).to be_an_instance_of(Facility)
    end
  end

  describe '#create_mo_facilities' do
    it 'can create and store facilities' do
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

      @facility_factory.create_mo_facilities(mo_dmv_office_locations)

      expect(@facility_factory.facilities).to be_a(Array)
      expect(@facility_factory.facilities[0]).to be_an_instance_of(Facility)
    end
  end

end