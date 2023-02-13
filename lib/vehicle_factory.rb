class VehicleFactory
  attr_reader :vehicles, :create_vehicles, :ny_vehicles

  def initialize
    @vehicles = []
    @ny_vehicles = []
  end
  
  def create_vehicles(wa_ev_registrations)
    wa_ev_registrations.each do |vehicle|
      vehicle_info = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev,
        registration_date: nil,
        plate_type: nil
      }
      @vehicles << vehicle = Vehicle.new(vehicle_info)
    end
      @vehicles
  end

  def create_ny_vehicles(ny_registrations)
    ny_registrations.select do |vehicle|
      if vehicle[:record_type] == 'VEH'        
        vehicle_info = {
          :vin => vehicle[:vin],
          :year => vehicle[:model_year],
          :make => vehicle[:make],
          :model => vehicle[:body_type],
          :engine => vehicle[:fuel_type],
          :record_type => vehicle[:record_type]
          }
        @ny_vehicles << vehicle = Vehicle.new(vehicle_info)
      end
    end
    @ny_vehicles
  end
end

#Helper Methods