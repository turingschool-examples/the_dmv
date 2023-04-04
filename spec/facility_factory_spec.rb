require './lib/facility_factory'
require './lib/facility'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
  it 'Exists' do
    locations = FacilityFactory.new
    expect(locations).to be_an_instance_of(FacilityFactory)
  end

  it 'Can add Locations' do
    locations = FacilityFactory.new
    or_locations = DmvDataService.new.or_dmv_office_locations
    locations.create_facilities(or_locations)
  end

  it 'Can make other faciliteis' do
    oregon = FacilityFactory.new
    or_locations = DmvDataService.new.or_dmv_office_locations
    oregon.create_facilities(or_locations)
    # expect
#make tests and commit 
    new_york = FacilityFactory.new
    ny_locations = DmvDataService.new.ny_dmv_office_locations
    new_york.create_facilities(ny_locations)
    # expect

    missouri = FacilityFactory.new
    mo_locations = DmvDataService.new.mo_dmv_office_locations
    missouri.create_facilities(mo_locations)
    # expect(missouri)
   require 'pry'; binding.pry
  end



end