require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe VehicleFactory do
  it "is an instance of the Vehicle class" do
    facility_factory = FacilityFactory.new
    
    expect(facility_factory).to be_an_instance_of(FacilityFactory)
  end

  it "can create facility objects from database" do
    facility_factory = FacilityFactory.new
    co_dmv_office_locations =  DmvDataService.new.co_dmv_office_locations
    
    co_example = facility_factory.create_facilities(co_dmv_office_locations)
    
    expect(co_example[0].phone).to eq("(720) 865-4600")
    
    co_example.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility).to respond_to(:name)
      expect(facility).to respond_to(:phone)
      expect(facility).to respond_to(:address)
      expect(facility).to respond_to(:services)
    end
  end
    
  it "can create facility objects from the NY database" do
    facility_factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    
    ny_example = facility_factory.create_facilities(new_york_facilities)
    
    expect(ny_example[0].phone).to eq("5857531604")
    
    ny_example.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility).to respond_to(:name)
      expect(facility).to respond_to(:phone)
      expect(facility).to respond_to(:address)
      expect(facility).to respond_to(:services) 
    end
  end
      
  it "can create facility objects from the MO database" do
    facility_factory = FacilityFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    
    mo_example = facility_factory.create_facilities(missouri_facilities)

    expect(mo_example[0].phone).to eq("(417) 448-5705")
    
    mo_example.each do |facility|
      expect(facility).to be_an_instance_of(Facility)
      expect(facility).to respond_to(:name)
      expect(facility).to respond_to(:phone)
      expect(facility).to respond_to(:address)
      expect(facility).to respond_to(:services)
    end
  end
end
