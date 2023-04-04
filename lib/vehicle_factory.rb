require "spec_helper"

class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(database)
    if database.first.keys.include?(:scofflaw_indicator)
      vehicle_database = database.find_all do |record|
        record[:record_type] == "VEH"
      end
      # require 'pry'; binding.pry
      vehicle_database.each do |vehicle|
        engine = :ice unless vehicle[:fuel_type] != "GAS"
        @vehicles << Vehicle.new(
          {
            vin: vehicle[:vin],
            year: vehicle[:model_year],
            make: vehicle[:make],
            model: vehicle[:body_type],
            engine: engine
          }
        )
      end
    else
      database.each do |vehicle|
        @vehicles << Vehicle.new(
          {
            vin: vehicle[:vin_1_10],
            year: vehicle[:model_year],
            make: vehicle[:make],
            model: vehicle[:model],
            engine: :ev
          }
        )
      end
    end
  end
end
