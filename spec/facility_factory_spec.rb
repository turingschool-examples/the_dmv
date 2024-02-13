require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe'#Facility factory' do 
    it 'shows where the dmv offices are in Colorado' do 
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facilities(@co_dmv_office_locations)
      expect(facilities).to be_a(Array)
    end

    it 'shows where the dmv offices are in New york' do 
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facilities(@new_york_facilities)
      expect(facilities).to be_a(Array)
    end

    it 'shows where the dmv offices are in Missouri' do 
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facilities(@missouri_facilities)
      expect(facilities).to be_a(Array)
    end
  end
end