require 'spec_helper'
require './lib/dmv_facility'

RSpec.describe DmvFacility do
  before :each do
    @dmv = DmvFacility.new(:co)
    @dmv_data_service = DmvDataService.new
    @dmv_api_data = @dmv_data_service.co_dmv_office_locations
  end

  it 'is instance object of DmvFacility' do
    expect(@dmv = DmvFacility.new(:co)).to be_an_instance_of(DmvFacility)
  end

  it 'creates dmv locations for CO' do
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
    
    expect(dmv_2.address).to eq("4685 Peoria Street")
    expect(dmv_3.address_suite).to be(nil)
    expect(dmv_2.city).to eq("Denver")
    expect(dmv_3.state).to eq("CO")
    expect(dmv_4.dmv_office).to eq("DMV Southwest Branch")
    expect(dmv_5.hours).to eq("Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.")
    expect(dmv_4.phone).to eq("(720) 865-4600")
    expect(dmv_5.services).to eq("vehicle titles, registration, renewals;  VIN inspections")
  end
end

RSpec.describe DmvFacility do
  before :each do
    @co_dmv = DmvFacility.new(:co)
    @ny_dmv = DmvFacility.new(:ny)
    @mo_dmv = DmvFacility.new(:mo)
  end

  it 'is an instance object of DmvFacility' do
    expect(@co_dmv = DmvFacility.new(:co)).to be_an_instance_of(DmvFacility)
    expect(@ny_dmv = DmvFacility.new(:ny)).to be_an_instance_of(DmvFacility)
    expect(@mo_dmv = DmvFacility.new(:mo)).to be_an_instance_of(DmvFacility)
  end

  it 'can pull data for New York state' do
    @ny_dmv.create_dmv_facility
    ny_dmvs = @ny_dmv.dmv_office_locations
    expect(ny_dmvs.size).to eq(5)

    ny_1 = ny_dmvs[0]
    ny_2 = ny_dmvs[1]
    ny_3 = ny_dmvs[2]
    ny_4 = ny_dmvs[3]
    ny_5 = ny_dmvs[4]

  end


end