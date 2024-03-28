require 'pry'
require './lib/dmv'
require './lib/facility'
require './lib/vehicle'
require './lib/dmv_data_service'
require './lib/registrant'

RSpec.configure do |config|
    config.formatter = :documentation
end
