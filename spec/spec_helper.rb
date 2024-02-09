require 'pry'

require './lib/dmv.rb'
require './lib/dmv_data_service.rb'
require './lib/facility.rb'
require './lib/registrant.rb'
require './lib/vehicle.rb'

RSpec.configure do |config|
    config.formatter = :documentation
end