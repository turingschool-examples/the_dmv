require 'spec_helper'


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
    it 'creates Facility objects with given attributes from Colorado data source' do
      @office_list = @co_office.create_offices(@co_dmv_office_locations)
      expect(@office_list.length).to eq(@co_dmv_office_locations.length)
      expect(@office_list.first).to be_a(Facility)
    end

    it 'creates Facility objects with given attributes from New York data source' do
      @office_list = @ny_office.create_offices(@ny_dmv_office_locations)
      expect(@office_list.length).to eq(@ny_dmv_office_locations.length)
      expect(@office_list.first).to be_a(Facility)
    end

    it 'creates Facility objects with given attributes from Missouri data source' do
      @office_list = @mo_office.create_offices(@mo_dmv_office_locations)
      expect(@office_list.length).to eq(@mo_dmv_office_locations.length)
      expect(@office_list.first).to be_a(Facility)
    end
  end
end
