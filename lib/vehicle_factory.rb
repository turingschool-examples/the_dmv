class VehicleFactory
  attr_reader :vehicle_instances

  def initialize
    @vehicle_instances = []
  end

  def create_vehicles(state_vehicle_registrations)
    @vehicle_instances = state_vehicle_registrations.map do |vehicle|
      (Vehicle.new(
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      ))
    end
  end

  def most_popular_make
    make_count = {}

    @vehicle_instances.each do |vehicle|
      make_count[vehicle.make] =+ 1
    end
    most_popular_make = find_most_popular(make_count)

    return most_popular_make
  end

  def most_popular_model
    model_count = {}

    @vehicle_instances.each do |vehicle|
      model_count[vehicle.model] =+ 1
    end
    most_popular_model = find_most_popular(model_count)
    return most_popular_model
  end



  #generic "find most popular in a hash" fetcher (Thanks StackOverflow)
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


