require 'spec_helper'

class VehicleFactory
  attr_reader :created_vehicles, :create_vehicles, :most_by_county
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(registrations)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    ny_state_registrations = DmvDataService.new.ny_state_registrations
    create_vehicle_based_on_state(registrations)
  end



  def most_by_county(registrations)
    grouped = registrations.group_by { |car| car[:county] }
    sorted = grouped.sort_by{|k,v| -v.count}
    top_county = sorted[0][0]
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
          county: car[:county],
          engine: "ev" 
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
          engine: "ev"
        }
        @created_vehicles << vehicle = Vehicle.new(vehicle_details)
      end
      @created_vehicles
    end
  end
end