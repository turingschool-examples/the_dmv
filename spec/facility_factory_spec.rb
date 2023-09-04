require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    facility = FacilityFactory.new
    colorado_facilities = DmvDataService.new.co_dmv_office_locations
  end

  describe "create_vehicles" do 
    it "will create vehicle objects with registration " do 
      facility.create_facility(colorado_facilities).each do |data|
      expect(api_data).to be_an_instance_of(Facility)
    end
  end
 end 
end   