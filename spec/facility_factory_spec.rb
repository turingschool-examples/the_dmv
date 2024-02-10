require 'spec_helper'

RSpec.describe FacilityFactory do
  let (:factory) { FacilityFactory.new }
  let (:colorado_facilities) { DmvDataService.new.co_dmv_office_locations }
  let (:new_york_facilities) { DmvDataService.new.ny_dmv_office_locations }
  let (:missouri_facilities) { DmvDataService.new.mo_dmv_office_locations }
  it 'exists' do
    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  it 'has no facilities by default' do
    expect(factory.facilities).to be_empty
  end

  it 'can create facilities' do
    expect(factory.facilities).to be_empty

    factory.create_facility(colorado_facilities)

    expect(factory.facilities[0]).to be_an_instance_of(Facility)
    expect(factory.facilities[0].address).not_to be(nil)
    expect(factory.facilities[0].name).not_to be(nil)
    expect(factory.facilities[0].phone).not_to be(nil)
  end

  # it 'can create facilities from different data sources' do
  #   expect(factory.facilities).to be_empty

  #   factory.create_facility(new_york_facilities)
  # end
end