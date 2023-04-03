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

    def most_popular_car
      model_count = Hash.new(0)
      @vehicles.each do |vehicle|
        model_count[vehicle.model] += 1
      end
      model_count.sort_by do |model, num|
        num 
      end.reverse[0]
    end
  end

  
