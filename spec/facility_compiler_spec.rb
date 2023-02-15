require 'spec_helper'

RSpec.describe FacilityCompiler do
  it 'exists' do
    factories = FacilityCompiler.new
    expect(factories).to be_an_instance_of FacilityCompiler
  end

  it 'has oregon facilities data set' do
    factories = FacilityCompiler.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    expect(or_dmv_office_locations).to eq(or_dmv_office_locations)
  end

  it 'can create facilities with oregon data set' do
    factories = FacilityCompiler.new
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    created_facilities = factories.create_facilities(or_dmv_office_locations)

    expect(created_facilities).to be_a(Array)
    expect(created_facilities[0]).to be_a(Facility)
    expect(created_facilities.size).to eq(59)
  end

  it 'can create facilities with New York data set' do
    factories = FacilityCompiler.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    created_facilities = factories.create_facilities_ny(new_york_facilities)
    
    expect(created_facilities).to be_a(Array)
    expect(created_facilities[0]).to be_a(Facility)
    expect(created_facilities.size).to eq(169)
  end
  
  it 'can create facilities with New York data set' do
    factories = FacilityCompiler.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    created_facilities = factories.create_facilities_mo(missouri_facilities)
    
    expect(created_facilities).to be_a(Array)
    expect(created_facilities[0]).to be_a(Facility)
    expect(created_facilities.size).to eq(178)
    require 'pry'; binding.pry
  end
end