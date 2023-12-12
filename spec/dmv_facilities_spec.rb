require 'spec_helper'

RSpec.describe DmvFacilities do
  before(:each) do
    @dmv_facilities = DmvFacilities.new
    @dds = DmvDataService.new
    
  end
  describe 'create a facility' do
    it 'is a facility' do
      expect(@dmv_facilities).to be_an_instance_of (DmvFacilities)
    end

    it 'verify data' do
      
      co_dmv_office_locations = @dds.co_dmv_office_locations
    end

    it 'creates CO facilities' do
      co_dmv_office_locations = @dds.co_dmv_office_locations
      facilities = @dmv_facilities.create_facilities(co_dmv_office_locations)
      facility = facilities.first

      expect(facilities.class).to eq (Array)
      expect(facility).to be_a(Facility)
    end

    it 'creates NY facilities' do

        ny_dmv_office_locations = @dds.ny_dmv_office_locations
        facilities = @dmv_facilities.create_ny_facilities(ny_dmv_office_locations)
        facility = facilities.first

        expect(facilities.class).to eq (Array)
        expect(facility).to be_a(Facility)
        
    end

    it 'creates MO facilities' do
        mo_dmv_office_locations = @dds.mo_dmv_office_locations
        facilities = @dmv_facilities.create_mo_facilities(mo_dmv_office_locations)
        facility = facilities.first

        expect(facilities.class).to eq (Array)
        expect(facility).to be_a(Facility)
    end
  end
end