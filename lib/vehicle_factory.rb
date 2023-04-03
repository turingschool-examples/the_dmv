class WaVehicleFactory
  
  attr_reader :vehicles

    def initialize()
      @vehicles = []
    end

    def create_vehicles(source)
      @vehicles << source
      @vehicles.flatten!
      
      @vehicles.each do |vehicle|
        vehicle[:vin] = vehicle[:vin_1_10]
        vehicle[:year] = vehicle[:model_year]
        vehicle[:engine] = :ev   
      end
      @vehicles.map! do |vehicle|
        Vehicle.new(vehicle)
      end
    end


  end
