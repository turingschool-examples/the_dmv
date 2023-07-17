require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @factory = FacilityFactory.new
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  describe '#create facilities' do 
    it 'can create facility objects' do 
      
    end
  end
end