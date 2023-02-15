require 'spec_helper'

RSpec.describe FacilityDmv do
  it 'exists and pulls OR data from API' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv).to be_an_instance_of(FacilityDmv)
    expect(oregon_facilities).to be_an_instance_of(Array)
    expect(oregon_facilities.size).to eq(59)
  end

  it 'creates new OR facility_dmv instances' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv.create_or_facility(oregon_facilities)).to be_an_instance_of(Array)
    expect(facility_dmv.create_or_facility(oregon_facilities)[0][:title]).to eq("Albany DMV Office")
    expect(facility_dmv.create_or_facility(oregon_facilities)[1][:title]).to eq("Ashland DMV Office")
  end

  it 'can add a facility to the array' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(facility_dmv.or_facilities).to eq([])
    facility_dmv.create_or_facility(oregon_facilities)
    expect(facility_dmv.or_facilities.count).to eq(59)
  end

  it 'can convert a ny address from API info' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new

      hash_in_string = "{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"

    expect(facility_dmv.ny_address_converter(hash_in_string)).to eq("2242 Santiam Hwy SE Albany OR 97321")
  end

  it 'can convert a ny phone number from API info' do
    facility_dmv = FacilityDmv.new
    oregon_facilities = DmvDataService.new

    expect(facility_dmv.ny_phone_converter("5857531604")).to eq("585-753-1604")
  end

  it 'exits and pulls NY data from API' do
    facility_dmv = FacilityDmv.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(facility_dmv).to be_an_instance_of(FacilityDmv)
    expect(new_york_facilities).to be_an_instance_of(Array)
    expect(new_york_facilities.size).to eq(169)
  end

  it 'creates new NY facility_dmv instances' do
    facility_dmv = FacilityDmv.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(facility_dmv.create_ny_facility(new_york_facilities)).to be_an_instance_of(Array)
    expect(facility_dmv.create_ny_facility(new_york_facilities)[0][:office_name]).to eq("JAMESTOWN")
    expect(facility_dmv.create_ny_facility(new_york_facilities)[1][:office_name]).to eq("SARATOGA SPRINGS - WILTON")
    expect(facility_dmv.ny_facilities[0].name).to eq("JAMESTOWN")
  end

  it 'can convert a mo phone number from API info' do
    facility_dmv = FacilityDmv.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(facility_dmv.mo_phone_converter("(314) 887-1050")).to eq("(314)-887-1050")
  end

  it 'exits and pulls MO data from API' do
    facility_dmv = FacilityDmv.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    expect(facility_dmv).to be_an_instance_of(FacilityDmv)
    expect(missouri_facilities).to be_an_instance_of(Array)
    expect(missouri_facilities.size).to eq(178)
  end

  it 'creates new MO facility_dmv instances' do
    facility_dmv = FacilityDmv.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    expect(facility_dmv.create_mo_facility(missouri_facilities)).to be_an_instance_of(Array)
    expect(facility_dmv.create_mo_facility(missouri_facilities)[0][:name]).to eq("SAINTE GENEVIEVE ")
    expect(facility_dmv.create_mo_facility(missouri_facilities)[0][:state]).to eq("MO")
  end
end