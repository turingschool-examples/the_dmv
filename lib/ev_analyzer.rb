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
    counties = @vehicles.map{|vehicle| vehicle.county}
    counted_counties = {}
    most_registrations = 0
    most_registered_county = nil

    counties.each do |county|
      if counted_counties.include?(county) == false
        counted_counties[county] = 1
      else
        counted_counties[county] += 1
      end
    end

    counted_counties.each do |county, number_of_registrations|
      if number_of_registrations > most_registrations
        most_registrations = number_of_registrations
        most_registered_county = county
      end
    end

    "#{most_registered_county} county: #{most_registrations} registrations"
  end
end