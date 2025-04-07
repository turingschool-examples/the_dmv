require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  it 'exists' do
    expect(@facility_factory).to be_a(FacilityFactory)
  end

  it 'creates a CO location' do
    facilities = @facility_factory.create_factories("Colorado", @co_dmv_office_locations)
    expect(facilities).to be_a(Array)
    
    expect(facilities[0]).to be_a(Facility)
    expect(facilities[0].name).to eq("DMV Tremont Branch")
    expect(facilities[0].address).to eq("2855 Tremont Place")
    expect(facilities[0].phone).to eq("(720) 865-4600")

    expect(facilities[1]).to be_a(Facility)
    expect(facilities[1].name).to eq("DMV Northeast Branch")
    expect(facilities[1].address).to eq("4685 Peoria Street")
    expect(facilities[1].phone).to eq("(720) 865-4600")

    expect(facilities[2]).to be_a(Facility)
    expect(facilities[2].name).to eq("DMV Northwest Branch")
    expect(facilities[2].address).to eq("3698 W. 44th Avenue")
    expect(facilities[2].phone).to eq("(720) 865-4600")
  end

  it 'creates a NY location' do
    facilities = @facility_factory.create_factories("New York", @new_york_facilities = DmvDataService.new.ny_dmv_office_locations)
    expect(facilities).to be_a(Array)
    
    expect(facilities[0]).to be_a(Facility)
    expect(facilities[0].name).to eq("LAKE PLACID")
    expect(facilities[0].address).to eq("2693 MAIN STREET")
    expect(facilities[0].phone).to eq(nil)

    expect(facilities[1]).to be_a(Facility)
    expect(facilities[1].name).to eq("HUDSON")
    expect(facilities[1].address).to eq("560 WARREN STREET")
    expect(facilities[1].phone).to eq("5188283350")

    expect(facilities[2]).to be_a(Facility)
    expect(facilities[2].name).to eq("RIVERHEAD KIOSK")
    expect(facilities[2].address).to eq("200 OLD COUNTRY ROAD")
    expect(facilities[2].phone).to eq(nil)
  end

  it 'creates a MO location' do
    facilities = @facility_factory.create_factories("Missouri", @missouri_facilities = DmvDataService.new.mo_dmv_office_locations)
    expect(facilities).to be_a(Array)
    
    expect(facilities[0]).to be_a(Facility)
    expect(facilities[0].name).to eq("Cameron")
    expect(facilities[0].address).to eq("508 Lana DR")
    expect(facilities[0].phone).to eq("(816) 632-4830")

    expect(facilities[1]).to be_a(Facility)
    expect(facilities[1].name).to eq("Marble Hill")
    expect(facilities[1].address).to eq("301 Union St")
    expect(facilities[1].phone).to eq("(573) 238-3225")

    expect(facilities[2]).to be_a(Facility)
    expect(facilities[2].name).to eq("Sugar Creek")
    expect(facilities[2].address).to eq("521 S Sterling AVE")
    expect(facilities[2].phone).to eq("(816) 836-9191")
  end
end 