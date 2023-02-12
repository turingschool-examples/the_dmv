require 'spec_helper'

class VehicleFactory
  attr_reader :created_vehicles, :create_vehicles
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(registrations)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    ny_state_registrations = DmvDataService.new.ny_state_registrations
    create_vehicle_based_on_state(registrations)
  end

  # Helper methods

  def create_vehicle_based_on_state(registrations)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    ny_state_registrations = DmvDataService.new.ny_state_registrations
    if registrations == wa_ev_registrations
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
        @created_vehicles << vehicle = Vehicle.new(vehicle_details)
      end
      @created_vehicles
    elsif registrations == ny_state_registrations
      cars = ny_state_registrations.find_all {|vehicle_type| vehicle_type[:record_type] == "VEH"}
      cars.each do |car|
        vehicle_details = {
          vin: car[:vin],
          year: car[:model_year],
          make: car[:make],
          model: car[:model],
          engine: "ev",
          registration_date: nil,
          plate_type: nil
        }
        @created_vehicles << vehicle = Vehicle.new(vehicle_details)
      end
      @created_vehicles
    end
  end
end