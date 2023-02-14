class VehicleAnalyzer
  attr_reader :vehicles

  def initialize
    @vehicles = VehicleFactory.new.create_vehicles(DmvDataService.new.wa_ev_registrations)
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