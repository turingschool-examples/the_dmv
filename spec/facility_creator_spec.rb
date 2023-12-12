require 'spec_helper'

RSpec.describe Facility_creator do 
  describe '#initialize' do 
    it 'initializes' do 
      facility_creator = Facility_creator.new 
      expect(facility_creator).to be_an_instance_of(Facility_creator)
    end 
  end
#create facilities for each, use co as template.
  describe '#create_co_facilities' do 
    it 'is a CO instance of Facility' do 
      facility_creator = Facility_creator.new 
      colorado_facilities = DmvDataService.new.co_dmv_office_locations

      expect(facility_creator.create_co_facilities(colorado_facilities).first).to be_an_instance_of(Facility)
    end

    it 'can access the data' do 
      facility_creator = Facility_creator.new 
      colorado_facilities = DmvDataService.new.co_dmv_office_locations

      expect(facility_creator.create_co_facilities(colorado_facilities).first.name).not_to be(nil)
      expect(facility_creator.create_co_facilities(colorado_facilities).first.address).not_to be(nil)
      expect(facility_creator.create_co_facilities(colorado_facilities).first.registered_vehicles).to eq([])
      expect(facility_creator.create_co_facilities(colorado_facilities).first.collected_fees).to eq(0)
      expect(facility_creator.create_co_facilities(colorado_facilities).first.services).not_to be(nil)
      expect(facility_creator.create_co_facilities(colorado_facilities).first.phone).not_to be(nil)
    end 
  end

  describe '#create_ny_facilities' do 
    it 'is an object of Facility' do 
      facility_creator = Facility_creator.new 
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(facility_creator.create_ny_facilities(new_york_facilities).first).to be_an_instance_of(Facility)
    end

    it 'can access the data' do 
      facility_creator = Facility_creator.new 
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(facility_creator.create_ny_facilities(new_york_facilities).first.name).not_to be(nil)
      expect(facility_creator.create_ny_facilities(new_york_facilities).first.address).not_to be(nil)
      expect(facility_creator.create_ny_facilities(new_york_facilities).first.phone).not_to be(nil)
      expect(facility_creator.create_ny_facilities(new_york_facilities).first.registered_vehicles).to eq([])
      expect(facility_creator.create_ny_facilities(new_york_facilities).first.collected_fees).to eq(0)
    end 
  end 

  describe '#create_mo_facilities' do 
    it 'is an object of Facility' do 
      facility_creator = Facility_creator.new 
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      
      expect(facility_creator.create_mo_facilities(missouri_facilities).first).to be_an_instance_of(Facility)
    end

    it 'can access the facility data' do 
      facility_creator = Facility_creator.new 
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(facility_creator.create_mo_facilities(missouri_facilities).first.name).not_to be(nil)
      expect(facility_creator.create_mo_facilities(missouri_facilities).first.address).not_to be(nil)
      expect(facility_creator.create_mo_facilities(missouri_facilities).first.phone).not_to be(nil)
      expect(facility_creator.create_mo_facilities(missouri_facilities).first.registered_vehicles).to eq([])
      expect(facility_creator.create_mo_facilities(missouri_facilities).first.collected_fees).to eq(0)
    end      
  end 
end