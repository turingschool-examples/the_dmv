require './lib/vehicle'
require './lib/factory'
require './lib/dmv_data_service'
require 'pry'

class VehicleFactory

  def initialize
   
  end

  def create_vehicles(details)
    details.map do |detail|
      Vehicle.new(
        vin: detail[:vin_1_10],
        year: detail[:model_year],
        make: detail[:make],
        model: detail[:model],
        engine: :ev,
        registration_date: nil
        )
    end
  end

end