require 'spec_helper'

RSpec.describe FacilityFactory do

  describe "exists" do
    it 'exists' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe "#create_facilities" do
    it '#create_facilities' do
      factory = FacilityFactory.new
      oregon_facilities = DmvDataService.new.or_dmv_office_locations
      facility = factory.create_facilities(oregon_facilities)
      
      expect(facility[0].name).to eq('Albany DMV Office')
      expect(facility[0].address).to eq('97321')
      expect(facility[0].phone).to eq('541-967-2014')
      expect(facility[0].services).to eq([])
      expect(facility[0].registered_vehicles).to eq([])
      expect(facility[0].collected_fees).to eq(0)
    end 

    it 'checks the values of other Oregon facilities' do 
      factory = FacilityFactory.new
      oregon_facilities = DmvDataService.new.or_dmv_office_locations
      facility = factory.create_facilities(oregon_facilities)
      
      expect(facility[2].name).to eq('Astoria DMV Office')
      expect(facility[2].address).to eq('97103')
      expect(facility[2].phone).to eq('503-325-3951')
      expect(facility[2].services).to eq([])
      expect(facility[2].registered_vehicles).to eq([])
      expect(facility[2].collected_fees).to eq(0)
    end
  

    it 'creates facilities for New York' do
      factory = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      facility = factory.create_facilities(new_york_facilities)
      
      expect(facility[0].name).to eq('SELDEN')
      expect(facility[0].address).to eq('407 SELDEN RD, SELDEN, NY 11784')
      expect(facility[0].phone).to eq('N/A')
      expect(facility[0].services).to eq([])
      expect(facility[0].registered_vehicles).to eq([])
      expect(facility[0].collected_fees).to eq(0)
    end
  

    it 'checks the values of other New York facilities' do 
      factory = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      facility = factory.create_facilities(new_york_facilities)
  
      expect(facility[2].name).to eq('SARANAC LAKE')
      expect(facility[2].address).to eq('39 MAIN STREET, SARANAC LAKE, NY 12983')
      expect(facility[2].phone).to eq('N/A')
      expect(facility[2].services).to eq([])
      expect(facility[2].registered_vehicles).to eq([])
      expect(facility[2].collected_fees).to eq(0)
    end
  end

end