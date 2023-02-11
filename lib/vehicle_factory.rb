require 'spec_helper'

class VehicleFactory
  attr_reader :created_vehicles, :create_vehicles
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(registrations)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_ev_registrations.each do |car|
      vehicle_details = {
        vin: car[:vin_1_10],
        year: car[:model_year],
        make: car[:make],
        model: car[:model],
        engine: "ev",
        registration_date: nil,
        plate_type: nil
      }
      @created_vehicles << (vehicle = Vehicle.new(vehicle_details))
    end
    @created_vehicles
  end
end