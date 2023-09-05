require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require'./lib/dmv_data_service'
require'./lib/dmv_factory'

RSpec.describe DmvFactory do
  before(:each) do
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    @co_office = DmvFactory.new
    @ny_office = DmvFactory.new
    @mo_office = DmvFactory.new
  end
  describe '#create_offices' do
    it 'creates Facility Location objects from API data' do
      @office_list = @co_office.create_offices(@co_dmv_office_locations)
      expect(@office_list.length).to eq(@co_dmv_office_locations.length)
      expect(@office_list.first).to be_a(Facility)
      
    end
     it 'creates Facility Location objects from API data from multiple cities' do
      @office_list = @ny_office.create_offices(@ny_dmv_office_locations)
      expect(@office_list.length).to eq(@ny_dmv_office_locations.length)
      expect(@office_list.first).to be_a(Facility)
    end
    it 'creates Facility Location objects from API data from multiple cities' do
      @office_list = @mo_office.create_offices(@mo_dmv_office_locations)
      expect(@office_list.length).to eq(@mo_dmv_office_locations.length)
      expect(@office_list.first).to be_a(Facility)
    end
  end
end