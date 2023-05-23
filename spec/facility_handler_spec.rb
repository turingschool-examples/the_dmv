require 'pry'
require './lib/facility_handler'
require './lib/dmv_data_service'

RSpec.describe Facility_handler do
  it 'can parce data from api sources' do
    facility_array = Facility_handler.new
    expect(facility_array).to be_a(Array)
  end
  #@or_dmv_office_locations

end