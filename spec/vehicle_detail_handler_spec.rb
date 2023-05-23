require './lib/vehicle_detail_handler'
require 'pry'
require './lib/dmv'
require './lib/facility'
require './lib/vehicle'
require './lib/dmv_data_service'

RSpec.describe Vehicle_detail_handler do
  it 'can take in data types and switch the symbol' do
    Vehicle_detail_handler.new
  end
end