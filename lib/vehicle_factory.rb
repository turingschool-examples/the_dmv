class VehicleFactory
  attr_reader :vehicle_instances

  def initialize
    @vehicle_instances = []
  end

  def create_vehicles(state_vehicle_registrations)
    @vehicle_instances = state_vehicle_registrations.map do |vehicle|
      (Vehicle.new(
        vin: vehicle[:vin_1_10] || vehicle[:vin],
        year: vehicle[:model_year] || vehicle[:model_year],
        make: vehicle[:make] || vehicle[:make],
        model: vehicle[:model] || vehicle[:body_type],
        engine: vehicle[:fuel_type] || :ev
      ))
    end
  end

  def most_popular_make_and_model
    make_count = {}
    model_count = {}

    @vehicle_instances.each do |vehicle|
      make_count[vehicle.make] =+ 1
      model_count[vehicle.model] =+ 1
    end
    most_popular_make = find_most_popular(make_count)
    most_popular_model = find_most_popular(model_count)

    return most_popular_make, most_popular_model
  end

  #generic find methods

    def find_most_popular(count_hash)
      most_popular = nil
      max_count = 0
  
      count_hash.each do |item, count|
        if count > max_count
          most_popular = item
          max_count = count
        end
      end
      return most_popular
    end

end


