require './vehicle'

class VehicleFactory
  attr_accessor :created_vehicles
  
  def initialize
    @created_vehicles = []
  end

  def create_vehicles_by_state(state_database)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    ny_state_registrations = DmvDataService.new.ny_dmv_office_locations

    if registrations == wa_ev_registrations
      wa_ev_registrations.each do |car|
        vehicle_details = {
            vin: car[:vin_1_10],
            year: car[:model_year],
            make: car[:make],
            model: car[:model],
            engine: 'ev'
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
            engine: 'ev'
        }
        @created_vehicles << vehicle = Vehicle.new(vehicle_details)
      end
      @created_vehicles
    end
  end
end