require 'pry'
require './lib/dmv'
require './lib/facility'
require './lib/vehicle'
require './lib/dmv_data_service'
require './lib/registrant'
require './lib/vehicle_factory'
require './lib/facility_factory'
require './lib/most_popular_finder'

RSpec.configure do |config|
    config.formatter = :documentation
end
