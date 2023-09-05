require 'spec_helper'
require './lib/dmv_facility'

RSpec.describe DmvFacility do
  before :each do
    @dmv = DmvFacility.new
    @dmv_data_service = DmvDataService.new
    @dmv_api_data = @dmv_data_service.co_dmv_office_locations
  end

  it 'is instance object of DmvFacility' do
    expect(@dmv = DmvFacility.new).to be_an_instance_of(DmvFacility)
  end

end