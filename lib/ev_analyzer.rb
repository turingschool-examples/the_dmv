class EvAnalyzer
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def get_vehicles(vehicles) 
    vehicles.map do |vehicle|
      vehicle_details = {
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev,
        county: vehicle[:county]
      }
      @vehicles << Vehicle.new(vehicle_details)
    end
  end

  def count_model_year(model_year)
    @vehicles.find_all {
      |vehicle| vehicle.year == model_year
    }.count
  end

  def most_registered_county
    counted_counties = Hash.new(0)
  
    @vehicles.each do |vehicle| 
      counted_counties[vehicle.county] += 1
    end
  
    most_registered_county, most_registrations = counted_counties.max_by { |county, count| count }
  
    "#{most_registered_county} county: #{most_registrations} registrations"
  end

  def most_popular_car
    counted_cars = Hash.new(0)

    @vehicles.each do |vehicle| 
      counted_cars["#{vehicle.make} #{vehicle.model}"] += 1 
    end

    most_popular_car, most_registrations = counted_cars.max_by { |car, count| count }

    "#{most_popular_car}: #{most_registrations} registrations"
  end
end