require 'spec_helper'

RSpec.describe FacilityFactory do

  it 'exists' do
    factory = FacilityFactory.new

    expect(factory).to be_instance_of(FacilityFactory)
  end

  it 'creates co facilities' do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    expect(factory.create_co_facilities(co_dmv_office_locations)).to be_instance_of(Array)
    expect(factory.create_co_facilities(co_dmv_office_locations)[0]).to be_instance_of(Facility)
    expect(factory.create_co_facilities(co_dmv_office_locations).first.name).not_to be(nil)
    expect(factory.create_co_facilities(co_dmv_office_locations).first.address).not_to be(nil)
    expect(factory.create_co_facilities(co_dmv_office_locations).first.phone).not_to be(nil)
    expect(factory.create_co_facilities(co_dmv_office_locations).first.services).not_to be(nil)
  end

  it 'creates ny facilities' do
    factory = FacilityFactory.new
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations

    expect(factory.create_ny_facilities(ny_dmv_office_locations)).to be_instance_of(Array)
    expect(factory.create_ny_facilities(ny_dmv_office_locations)[0]).to be_instance_of(Facility)
    expect(factory.create_ny_facilities(ny_dmv_office_locations).first.name).not_to be(nil)
    expect(factory.create_ny_facilities(ny_dmv_office_locations).first.address).not_to be(nil)
    expect(factory.create_ny_facilities(ny_dmv_office_locations).first.phone).not_to be(nil)
    expect(factory.create_ny_facilities(ny_dmv_office_locations).first.services).not_to be(nil)
  end

  it 'creates mo facilities' do
    factory = FacilityFactory.new
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

    expect(factory.create_mo_facilities(mo_dmv_office_locations)).to be_instance_of(Array)
    expect(factory.create_mo_facilities(mo_dmv_office_locations)[0]).to be_instance_of(Facility)
    expect(factory.create_mo_facilities(mo_dmv_office_locations).first.name).not_to be(nil)
    expect(factory.create_mo_facilities(mo_dmv_office_locations).first.address).not_to be(nil)
    expect(factory.create_mo_facilities(mo_dmv_office_locations).first.phone).not_to be(nil)
    expect(factory.create_mo_facilities(mo_dmv_office_locations).first.services).not_to be(nil)
  end

end