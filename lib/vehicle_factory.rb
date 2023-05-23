class VehicleFactory
  attr_reader :created_vehicles

  def initialize
    @created_vehicles = []
  end

  def create_vehicles(vehicles)
    vehicles.each do |vehicle_data|
      vehicle = Vehicle.new({
        vin: vehicle_data[:vin_1_10],
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev
        })
        @created_vehicles << vehicle
    end
    @created_vehicles
  end

  def find_most_popular
    make_model_counts = Hash.new(0)
    @created_vehicles.each do |vehicle|
      make_model =  "#{vehicle.make} #{vehicle.model}" 
      make_model_counts[make_model] += 1
    end

    max_count = 0
    most_popular_make_model = "No vehicles."
    make_model_counts.each do |make_model, count|
      if count > max_count
        max_count = count
        most_popular_make_model = make_model
      end
    end
    most_popular_make_model
  end

  def models_in_a_year(model, year)
    count = 0
    @created_vehicles.each do |vehicle|
      if vehicle.model == model && vehicle.year == year
        count += 1
      end
    end
    count
  end

  def vehicles_in_a_year(year)
    count = 0
    @created_vehicles.each do |vehicle|
      if vehicle.year == year
        count += 1
      end
    end
    count
  end
end