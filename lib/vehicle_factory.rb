require './lib/vehicle'
require './lib/dmv_data_service'

class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end
end