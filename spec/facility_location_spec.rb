require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require'./lib/dmv_data_service'
require'./lib/facility_location'

RSpec.describe FacilityLocation do
  before(:each) do
    @co_office = FacilityLocation.new(@co_dmv_office_locations)
    @ny_office = FacilityLocation.new(@ny_dmv_office_locations)
    @mo_office = FacilityLocation.new(@mo_dmv_office_locations)
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end
  describe '#create_offices' do
    it 'creates Facility Location objects from API data' do
      @office_list = @co_office.create_offices(@co_dmv_office_locations)
      
      expect(@office_list.length).to eq(@co_dmv_office_locations.length)
      expect(@office_list.first).to be_a(FacilityLocation)
      
    end
     it 'creates Facility Location objects from API data from multiple cities' do
      @office_list = @ny_office.create_offices(@ny_dmv_office_locations)
      
      expect(@office_list.length).to eq(@ny_dmv_office_locations.length)
      expect(@office_list.first).to be_a(FacilityLocation)
      
    end
  end
end