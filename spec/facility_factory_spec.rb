require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  end

  describe'#Facility factory' do 
    it 'shows where the dmv offices are in colorado' do 
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facilities(@co_dmv_office_locations)
      expect(facilities).to be_a(Array)
      

      # facilities.each do |facility|
      #   expect(facility.address).to_not be nil
      #   require 'pry'; binding.pry
      #   expect(facility.name).to_not be nil
      #   expect(facility.phone).to_not be nil
      # end
    end

    it 'shows where the dmv offices are in New york' do 
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facilities(@new_york_facilities)
      expect(facilities).to be_a(Array)
    end

    
  end
end