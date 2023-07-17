require 'spec_helper'
require './lib/dmv_data_service'
require './lib/facility'
require './lib/facility_factory'

RSpec.describe FacilityFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)

      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      expect(factory.find_facilities(co_dmv_office_locations)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)
    end
  end

  describe '#Sources' do
    it 'data sources from different states' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)

      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(factory.find_facilities(co_dmv_office_locations)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)

      expect(factory.find_facilities(new_york_facilities)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)

      expect(factory.find_facilities(missouri_facilities)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)
    end
  end

  describe '#Unit test' do
    it 'Address formatting check' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)

      expect(factory.format_co_address("address", nil, "city", "state", "zip")).to eq("address city state zip")
      expect(factory.format_co_address("address1", "address2", "city", "state", "zip")).to eq("address1 address2 city state zip")

      expect(factory.format_address("address", "city", "state", "zip")).to eq("address city state zip")
    end
  end

  describe '#Hours' do
    it 'open hours for each facility' do
      factory = FacilityFactory.new
      expect(factory).to be_an_instance_of(FacilityFactory)

      co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(factory.find_facilities(co_dmv_office_locations)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)
      expect(factory.dmv_list.last.open_hours).to be_an(String)
      
      expect(factory.find_facilities(new_york_facilities)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)
      expect(factory.dmv_list.last.open_hours).to be_an(String)

      expect(factory.find_facilities(missouri_facilities)).to be_an(Array)
      expect(factory.dmv_list.first).to be_an_instance_of(Facility) 
      expect(factory.dmv_list.last).to be_an_instance_of(Facility)
      expect(factory.dmv_list.length).to be_an(Integer)
      expect(factory.dmv_list.last.open_hours).to be_an(String)
    end
  end
end