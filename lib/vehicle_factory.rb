class VehicleFactory
  attr_reader :vehicles, :create_vehicles, :ny_vehicles, :wa_vehicles

  def initialize
    @vehicles = []
    @ny_vehicles = []
    @wa_vehicles = []
  end
  
  def create_vehicles(vehicles)
# require 'pry'; binding.pry
    if vehicles.first[:state] == 'NY'
      create_ny_vehicles(vehicles)
    elsif vehicles[0][:state_of_residence] == 'WA'
      create_wa_vehicles(vehicles)
    end
  end
  
  #Helper Methods
  
  def create_wa_vehicles(wa_ev_registrations)
    wa_ev_registrations.map do |vehicle|
      vehicle_info = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev,
        registration_date: nil,
        plate_type: nil
      }
      @wa_vehicles << vehicle = Vehicle.new(vehicle_info)
    end
  end
  
  def create_ny_vehicles(ny_registrations)
    # require 'pry'; binding.pry
    ny_registrations.select do |vehicle|
      # require 'pry'; binding.pry
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
        @ny_vehicles
      end
    end
    
  end
end