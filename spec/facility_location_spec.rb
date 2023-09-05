require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require'./lib/dmv_data_service'
require'./lib/facility_location'

RSpec.describe FacilityLocation do
  before(:each) do
    @office = FacilityLocation.new(@co_dmv_office_locations)
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end
  describe '#create_offices' do
    it 'creates Facility Location objects from API data' do
      @office_list = @office.create_offices(@co_dmv_office_locations)
      
      expect(@office_list.length).to eq(@co_dmv_office_locations.length)
      expect(@office_list.first).to be_a(FacilityLocation)
      
    end
  end
end