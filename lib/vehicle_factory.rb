class VehicleFactory
  
  attr_reader :vehicles

    def initialize()
      @vehicles = []
    end

    def add_wa_ev_source(source)
      source.each do |vehicle|
        normalized_data = Hash.new
        normalized_data[:vin] = vehicle[:vin_1_10]
        normalized_data[:year] = vehicle[:model_year]
        normalized_data[:make] = vehicle[:make]
        normalized_data[:model] = vehicle[:model]
        normalized_data[:engine] = :ev 
        @vehicles << normalized_data
      end
    end

    def create_vehicles
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

    def most_registered_county(source)
      county_count = Hash.new(0)
      source.each do |vehicle|
        county_count[vehicle[:county]] += 1
      end
      county_count.sort_by do |county, num|
        num
      end.reverse[0].first
    end
  end

  
  