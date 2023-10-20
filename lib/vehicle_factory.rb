require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'pry'

class VehicleFactory
  attr_accessor
  def initialize


  end

  def create_vehicles(source)
    nc_arr = []
    new_car = {
    vin: source[0][:vin_1_10],
    year: source[0][:model_year],
    make: source[0][:make],
    model: source[0][:model],
    engine: :ev,
    registration_date: nil,
    plate_type: nil
    }
   nc_arr << new_car.values
   binding.pry
  end

end
