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

  it 'creates dmv locations in CO' do
    @dmv.create_dmv_facility
    dmvs = @dmv.dmv_office_locations
    expect(dmvs.size).to eq(5)

    dmv_1 = dmvs[0]

    expect(dmv_1.address).to eq("2855 Tremont Place")
    expect(dmv_1.address_suite).to eq("Suite 118")
    expect(dmv_1.city).to eq("Denver")
    expect(dmv_1.state).to eq("CO")
    expect(dmv_1.dmv_office).to eq("DMV Tremont Branch")
    expect(dmv_1.hours).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
    expect(dmv_1.phone).to eq("(720) 865-4600")
    expect(dmv_1.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
  end

  it 'has data for multiple branches in CO' do
    @dmv.create_dmv_facility
    dmvs = @dmv.dmv_office_locations

    dmv_1 = dmvs[0]
    dmv_2 = dmvs[1]
    dmv_3 = dmvs[2]
    dmv_4 = dmvs[3]
    dmv_5 = dmvs[4]
    binding.pry
  end

end