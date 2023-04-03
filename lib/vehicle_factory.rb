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
        model_count[vehicle.make]
      end
      pop_model =  model_count.sort_by do |model, num|
        num 
      end.reverse[0].first
      make = @vehicles.find do |vehicle|
        vehicle.model == pop_model
      end
      most_pop = Hash.new(0)
      most_pop[:make] = make.make
      most_pop[:model] = pop_model
      most_pop
    end

    def count_mod_yr(model_, year_)
      @vehicles.select do |vehicle|
        vehicle.model.downcase == model_.downcase &&
        vehicle.year == year_.to_s
      end.count
    end
  end

  
  