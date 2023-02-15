class VehicleFactory 
  attr_reader :vehicle_storage
  def initialize
    @vehicle_storage = []
  end

  def create_vehicles(data)
    data.each do |car|
      car_hash = { 
      vin: car[:vin_1_10],
      year: car[:model_year],
      make: car[:make],
      model: car[:model],
      county: car[:county],
      engine: :ev
      }
      @vehicle_storage << Vehicle.new(car_hash)
    end
  end

  def most_popular_make_model
    "#{find_most_popular_make}, #{find_most_popular_model}"
  end
  
  def find_most_popular_make
    most_popular_make = @vehicle_storage.group_by { |vehicle| vehicle.make }
    most_popular_make.max_by {|make, vehicles| vehicles.length}.first
  end

  def find_most_popular_model
    popular_make = @vehicle_storage.select do |vehicle|
      vehicle.make == find_most_popular_make
    end
    most_popular_model = popular_make.group_by { |vehicle| vehicle.model }
    most_popular_model.max_by {|model, vehicles| vehicles.length}.first
  end

  def number_by_model_year(model, year)
    @vehicle_storage.select do |vehicle|
      vehicle.year == year && vehicle.model == model
    end.length
  end
  
  def county_with_most_vehicles(data)
    grouped_by_county = data.group_by { |vehicle| vehicle[:county] }
    grouped_by_county.max_by {|county, vehicles| vehicles.length}.first
  end
end