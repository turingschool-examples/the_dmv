require 'spec_helper'

RSpec.describe DMVFacility do
  it 'exists' do
    
    dmv_factory = DMVFacility.new

    expect(dmv_factory).to be_a DMVFacility
  end

  it 'can create OR facilities from APIs' do
    dmv_factory = DMVFacility.new

    or_dmv_data = DmvDataService.new.or_dmv_office_locations

    dmv_factory.create_or_dmv_facilities(or_dmv_data)

    expect(dmv_factory.list_of_OR_Facilities[0]).to be_a Facility

  end

  it 'can create NY facilities' do
    dmv_factory = DMVFacility.new

    ny_dmv_data = DmvDataService.new.ny_dmv_office_locations

    dmv_factory.create_ny_dmv_office_locations(ny_dmv_data)

    expect(dmv_factory.list_of_NY_Facilities[2]).to be_a Facility
  end

  it 'can create MO facilities' do
    dmv_factory = DMVFacility.new

    mo_dmv_data = DmvDataService.new.mo_dmv_office_locations

    dmv_factory.create_mo_dmv_office_locations(mo_dmv_data)

    expect(dmv_factory.list_of_MO_Facilities[3]).to be_a Facility
  end

  it 'can creat DMVs with any API data' do
    dmv_factory = DMVFacility.new

    or_dmv_data = DmvDataService.new.or_dmv_office_locations
    ny_dmv_data = DmvDataService.new.ny_dmv_office_locations
    mo_dmv_data = DmvDataService.new.mo_dmv_office_locations

    dmv_factory.create_dmv_facilities(or_dmv_data)
    dmv_factory.create_dmv_facilities(ny_dmv_data)
    dmv_factory.create_dmv_facilities(mo_dmv_data)

    expect(dmv_factory.list_of_DMVs.count).to eq(406)
  end
end
