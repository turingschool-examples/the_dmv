require 'pry'
require './lib/facility_handler'
require './lib/dmv_data_service'
require './lib/facility'

RSpec.describe FacilityHandler do
  it 'can parse from oregon' do
    facility_array = FacilityHandler.new
    oregon = DmvDataService.new.or_dmv_office_locations
    oregon_facilities = facility_array.create_oregon_facilities(oregon)
    oregon_facilities.each do |facility|
      expect(facility.address.include?('OR')).to eq(true)
    end
  end
  it 'can parce data from missouri' do
    facility_array = FacilityHandler.new
    missouri = DmvDataService.new.mo_dmv_office_locations
    missouri_facilities = facility_array.create_missouri_facilities(missouri)
    missouri_facilities.each do |facility|
      expect(facility.address.include?('MO')).to eq(true)
    end
  end
  it 'can parce data from new york' do
    facility_array = FacilityHandler.new
    new_york = DmvDataService.new.ny_dmv_office_locations
    new_york_facilities = facility_array.create_new_york_facilities(new_york)
    new_york_facilities.each do |facility|
      expect(facility.address.include?('NY')).to eq(true)
    end
  end
  it 'can select which state the dmv belongs to' do
    facility_array = FacilityHandler.new
    new_york = DmvDataService.new.ny_dmv_office_locations
    new_york_facilities = facility_array.state_sorter(new_york)
    new_york_facilities.each do |facility|
      expect(facility.address.include?('NY')).to eq(true)
    end
    missouri = DmvDataService.new.mo_dmv_office_locations
    missouri_facilities = facility_array.state_sorter(missouri)
    missouri_facilities.each do |facility|
      expect(facility.address.include?('MO')).to eq(true) 
    end
    oregon = DmvDataService.new.or_dmv_office_locations
    oregon_facilities = facility_array.create_oregon_facilities(oregon)
    oregon_facilities.each do |facility|
      expect(facility.address.include?('OR')).to eq(true)
    end
  end
end