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

    def most_popular_cars
      make_count = Hash.new(0)
      model_count = Hash.new(0)
      @vehicles.each do |vehicle|
        model_count[vehicle.model] += 1
        make_count[vehicle.make] += 1
      end
     pop_model =  model_count.sort_by do |model, num|
        num 
      end.reverse[0].first
     pop_make = make_count.sort_by do |model, num|
        num 
      end.reverse[0].first
      most_pop = Hash.new(0)
      most_pop[:make] = pop_make
      most_pop[:model] = pop_model
      most_pop
    end

    def count_mod_yr(model_, year_)
      # count = 0
      # @vehicles.each do |vehicle|
      #   if vehicle.model.downcase == model_.downcase &&
      #     vehicle.year == year_ 

      #     count += 1

      #   end
      # end
      # count

      @vehicles.select do |vehicle|
        vehicle.model.downcase == model_.downcase &&
        vehicle.year == year_
      end.count
    end
  end

  
