require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require'./lib/dmv_data_service'

RSpec.describe FacilityLocations do
  before(:each) do
    @office = FacilityLocation.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end
  describe '#create_offices' do
    it 'creates Facility Location objects from API data' do
      @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
      @office_list = @office_list.create_offices(@co_dmv_office_locations)
      
      expect(@office_list.length).to eq(@co_dmv_office_locations.length)
      expect(@office_list.first).to be_a(FacilityLocation)
      
    end
  end