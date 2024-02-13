require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  describe'#Facility factory'
    it 'shows where the dmv offices are' do 
      expect(@factory).to be_a(FacilityFactory)
      facilities = @factory.create_facilities(@co_dmv_office_locations)
      expect(facilities).to be_a(Array)
      require 'pry'; binding.pry
    end
end