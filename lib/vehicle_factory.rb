require './vehicle'

class VehicleFactory
  attr_accessor :created_vehicles
  
  def initialize
    @created_vehicles = []
  end

  def create_vehicles_by_state(state_database)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    ny_state_registrations = DmvDataService.new.ny_dmv_office_locations

    if state_database == wa_ev_registrations
      wa_ev_registrations.each do |car|
        @created_vehicles << Vehicle.new({
            vin: car[:vin_1_10],
            year: car[:model_year],
            make: car[:make],
            model: car[:model],
            engine: 'ev'
        })
      end
        @created_vehicles
    elsif state_database == ny_state_registrations
      vehicle_data.map do |vehicle|
        @created_vehicles << Vehicle.new({
            vin: vehicle[:vin],
            year: vehicle[:model_year],
            make: vehicle[:make],
            model: nil,
            engine: 'ev'
          })
      end
      @created_vehicles
    end
  end
end