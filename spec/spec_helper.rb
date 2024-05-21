require 'pry'
require './lib/dmv'
require './lib/vehicle'
require './lib/facility'
require './lib/registrant'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.configure do |config|
  config.formatter = :documentation
end
