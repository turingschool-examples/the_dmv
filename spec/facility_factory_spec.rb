require './lib/facility'
require './lib/facility_factory'
require './lib/dmv_data_service'


RSpec.describe FacilityFactory do
  it 'exists' do
    ffactory = FacilityFactory.new

    expect(ffactory).to be_an_instance_of FacilityFactory
  end

  it 'creates locations' do
    ffactory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    ffactory.create_locations(co_dmv_office_locations)
    # require'pry';binding.pry
    expect(ffactory.locations[0]).to be_an_instance_of Facility
    # expect(ffactory.locations[0][0]).to eq([:address])
  end
end