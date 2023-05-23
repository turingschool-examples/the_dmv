require 'pry'
require './lib/facility_handler'
require './lib/dmv_data_service'
require './lib/facility'

RSpec.describe Facility_handler do
  it 'can parce data from api sources' do
    facility_array = Facility_handler.new
    oregon = DmvDataService.new.or_dmv_office_locations
    oregon_facility = facility_array.create_facilities(oregon)
    expect(oregon_facility).to be_a(Array)
  end
  #@or_dmv_office_locations

end