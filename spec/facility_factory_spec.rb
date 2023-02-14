require 'spec_helper'

RSpec.describe FacilityFactory do

  it 'exists' do
    factory = FacilityFactory.new
    expect(factory).to be_a(FacilityFactory)
  end

  it 'creates Facilities' do
    factory = FacilityFactory.new

    or_dmv_facilities = DmvDataService.new.or_dmv_office_locations
    facilities = factory.create_facilities(or_dmv_facilities)

    expect(facilities).to be_an(Array)
    expect(facilities[0]).to be_a(Facility)

    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    facilities = factory.create_facilities(new_york_facilities)

    expect(facilities).to be_an(Array)
    expect(facilities[0]).to be_a(Facility)

    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    facilities = factory.create_facilities(missouri_facilities)
    
    expect(facilities).to be_an(Array)
    expect(facilities[0]).to be_a(Facility)
  end
end
