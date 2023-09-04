require 'spec_helper'

RSpec.describe FacilityFactory do
  
  describe "facility factory" do 
    it "will create vehicle objects with registration " do 
     facility = FacilityFactory.new
     colorado_facilities = DmvDataService.new.co_dmv_office_locations


      facility.create_facility(colorado_facilities).each do |data|
      expect(data).to be_an_instance_of(Facility)
      end
    end
   
    it "New York data " do 
     facility = FacilityFactory.new
     newyork_facilities = DmvDataService.new.ny_dmv_office_locations


      facility.create_facility(newyork_facilities).each do |data|
      expect(data).to be_an_instance_of(Facility)
      end
    end
    
    it "Missouri Data " do 
      facility = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
 
 
       facility.create_facility(missouri_facilities).each do |data|
       expect(data).to be_an_instance_of(Facility)
       end
     end
  end 
end   