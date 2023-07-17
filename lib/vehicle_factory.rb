require_relative 'vehicle'

class VehicleFactory

  def create_vehicles(data)
    if data[0][:state] == "NY"
      scrape_ny_vehicles(data)
    elsif data[0][:state_of_residence] == "WA"
      scrape_wa_vehicles(data)
    end
  end

  def scrape_wa_vehicles(data)
    vehicles_array = []
    data.each do |car|
      car_info = {vin: car[:vin_1_10],
                  year: car[:model_year],
                  make: car[:make],
                  model: car[:model],
                  county: car[:county],
                  engine: :ev
                }
      vehicles_array << Vehicle.new(car_info)
    end
    vehicles_array
  end

  def scrape_ny_vehicles(data)
    vehicles_array = []
    data.each do |vehicle|
      vehicle_info = {
        vin: vehicle[:vin],
        year: vehicle[:model_year],
        make: vehicle[:make],
        county: vehicle[:county],
        engine: vehicle[:fuel_type]
      }
      vehicles_array << Vehicle.new(vehicle_info)
    end
    vehicles_array
  end
end