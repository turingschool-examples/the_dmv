require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'faraday'
require 'json'
require 'pry'

class VehicleFactory
  attr_accessor
    def initialize
  end

  def create_vehicles(source)
    nc_arr = []
    source.each do |car|
      new_car = {
        vin: car[:vin_1_10],
        year: car[:model_year],
        make: car[:make],
        model: car[:model],
        engine: :ev}
      nc_arr << Vehicle.new(new_car)
    end
  end
end
