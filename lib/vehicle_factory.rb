class WaVehicleFactory
  
  attr_reader :vehicles

    def initialize()
      @vehicles = []
    end

    def create_vehicles(source)
      @vehicles << source
      @vehicles.flatten!
      
      @vehicles.map do |vehicle|
        vehicle[:vin] = vehicle.delete :vin_1_10
        vehicle[:year] = vehicle.delete :model_year
        vehicle[:engine] = :ev   
      end
      @vehicles.map! do |vehicle|
        Vehicle.new(vehicle)
      end
    end
  end
