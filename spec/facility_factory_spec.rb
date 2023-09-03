require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.describe FacilityFactory do
  it 'exists' do
    ffactory = FacilityFactory.new

    expect(ffactory).to be_an_instance_of FacilityFactory
  end

  it 'creates CO locations' do
    ffactory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    ffactory.create_locations(co_dmv_office_locations)
    # require'pry';binding.pry
    expect(ffactory.locations[0]).to be_an_instance_of Facility
    expect(ffactory.locations.first.name).to eq("DMV Tremont Branch")
    expect(ffactory.locations.first.address).to eq("2855 Tremont Place Suite 118, Denver, CO, 80205")
    expect(ffactory.locations.first.phone).to eq("(720) 865-4600")
    expect(ffactory.locations.first.services).to eq(["vehicle titles, registration, renewals;  VIN inspections"])

  end

  xit 'creates NY locations' do
    facility_factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    # require'pry';binding.pry

  end
end