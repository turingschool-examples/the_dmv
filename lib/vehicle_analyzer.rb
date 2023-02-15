class VehicleAnalyzer
  attr_reader :vehicles

  def initialize(vehicles)
    @vehicles = VehicleFactory.new.create_vehicles(vehicles)
  end

  def count_model_year(model_year)
    @vehicles.find_all {
      |vehicle| vehicle.year == model_year.to_i
    }.count
  end

  def most_registered_county
    counties = Hash.new(0)
  
    @vehicles.each do |vehicle| 
      counties[vehicle.county] += 1
    end
  
    county, count = counties.max_by { |county, count| count }
  
    "#{county} county: #{count} registrations"
  end

  def most_popular_car
    cars = Hash.new(0)

    @vehicles.each do |vehicle| 
      cars["#{vehicle.make} #{vehicle.model}"] += 1 
    end

    car, count = cars.max_by { |car, count| count }

    "#{car}: #{count} registrations"
  end
end