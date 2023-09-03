require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.describe FacilityFactory do
  it 'exists' do
    facility_factory = FacilityFactory.new

    expect(facility_factory).to be_an_instance_of FacilityFactory
  end

  it 'creates CO locations' do
    facility_factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    facility_factory.create_locations(co_dmv_office_locations)
    # require'pry';binding.pry
    expect(facility_factory.locations_co[0]).to be_an_instance_of Facility
    expect(facility_factory.locations_co.first.name).to eq("DMV Tremont Branch")
    expect(facility_factory.locations_co.first.address).to eq("2855 Tremont Place Suite 118, Denver, CO, 80205")
    expect(facility_factory.locations_co.first.phone).to eq("(720) 865-4600")
    expect(facility_factory.locations_co.first.services).to eq(["vehicle titles, registration, renewals;  VIN inspections"])

    # facility_factory.create_locations(co_dmv_office_locations).each do |location|
    #   expect(location).to be_an_instance_of(Facility)
    # end
  end

  it 'creates NY locations' do
    facility_factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    facility_factory.create_locations(new_york_facilities)

    # require'pry';binding.pry
    expect(facility_factory.locations_ny[0]).to be_an_instance_of Facility
    expect(facility_factory.locations_ny.first.name).to eq("EVANS")
    expect(facility_factory.locations_ny.first.address).to eq("6853 ERIE RD, DERBY, NY, 14006")
    expect(facility_factory.locations_ny.first.phone).to eq("7168587450")


  end

  it 'creates MO locations' do
    facility_factory = FacilityFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations\

    facility_factory.create_locations(missouri_facilities)
    # require'pry';binding.pry

    expect(facility_factory.locations_mo[0]).to be_an_instance_of Facility
    expect(facility_factory.locations_mo.first.name).to eq("OAKVILLE")
    expect(facility_factory.locations_mo.first.address).to eq("3164 TELEGRAPH ROAD, ST LOUIS, MO, 63125")
    expect(facility_factory.locations_mo.first.phone).to eq("(314) 887-1050")

  end
end