require 'spec_helper'

RSpec.describe FacilityFactory do

  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe "#create_facilities(data)" do
    it '#create_facilities' do
      factory = FacilityFactory.new
      oregon_facilities = DmvDataService.new.or_dmv_office_locations
      facility = factory.create_facilities(oregon_facilities)
      
      expect(facility[0].name).to eq('Albany DMV Office')
      expect(facility[0].address).to eq('2242 Santiam Hwy SE, Albany, OR 97321')
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
      expect(facility[2].address).to eq('705 W Marine Dr, Astoria, OR 97103')
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

    it 'creates facilities for Missouri' do
      factory = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      facility = factory.create_facilities(missouri_facilities)
    
      expect(facility[0].name).to eq('OAKVILLE')
      expect(facility[0].address).to eq('3164 TELEGRAPH ROAD, ST LOUIS, MO 63125')
      expect(facility[0].phone).to eq('(314) 887-1050')
      expect(facility[0].services).to eq([])
      expect(facility[0].registered_vehicles).to eq([])
      expect(facility[0].collected_fees).to eq(0)
    end

    it 'checks the values of other Missouri facilities' do 
      factory = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      facility = factory.create_facilities(missouri_facilities)
      
      expect(facility[4].name).to eq('NIXA')
      expect(facility[4].address).to eq('214A VILLAGE CENTER RD, NIXA, MO 65714')
      expect(facility[4].phone).to eq('(417) 725-9697')
      expect(facility[4].services).to eq([])
      expect(facility[4].registered_vehicles).to eq([])
      expect(facility[4].collected_fees).to eq(0)
    end
  end

end