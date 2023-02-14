require 'rspec'
require './lib/facility_builder'

RSpec.describe FacilityBuilder do
  it 'exists' do
    facility = FacilityBuilder.new

    expect(facility).to be_an_instance_of(FacilityBuilder)
  end

  it 'loads oregon locations' do
    facility = FacilityBuilder.new()
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    facility.load_locations(or_dmv_office_locations)

    expect(facility.locations.length).to eq(59)
    expect(facility.locations[0][:name]).to eq("Albany DMV Office")
    expect(facility.locations[1][:address]).to eq("600 Tolman Creek Rd Ashland OR 97520")
    expect(facility.locations[2][:phone]).to eq("503-325-3951")
  end

  it 'loads ny locations' do
    facility = FacilityBuilder.new()
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    facility.load_locations(new_york_facilities)

    expect(facility.locations.length).to eq(169)
    expect(facility.locations[0][:name]).to eq("JAMESTOWN")
    expect(facility.locations[1][:address]).to eq("3065 ROUTE 50 SARATOGA SPRINGS NY 12866")
    expect(facility.locations[2][:phone]).to eq("5857531604")
  end

  it 'loads mo locations' do
    facility = FacilityBuilder.new()
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    facility.load_locations(missouri_facilities)

    expect(facility.locations.length).to eq(178)
    expect(facility.locations[0][:name]).to eq("SAINTE GENEVIEVE ")
    expect(facility.locations[1][:address]).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
    expect(facility.locations[2][:phone]).to eq("(314) 499-7223")
  end
end