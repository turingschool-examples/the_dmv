require './lib/facility_factory'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
  it 'Exists' do
    factory = FacilityFactory.new
    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  it 'Can add Locations' do
    factory = FacilityFactory.new
    or_locations = DmvDataService.new.or_dmv_office_locations
    factory.create_facilites(or_locations)
  end
end