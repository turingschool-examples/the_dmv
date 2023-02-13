require './lib/vehicle'

class VehicleFactory
  def create_vehicles(vehicles_data)
    # I am only doing it this way to maintain the interaction pattern
    # from the end of iteration 2 where this method has no 2nd argument
    if vehicles_data.first[:state_of_residence] == 'WA'
      return create_wa_ev_vehicles(vehicles_data)
    else
      return create_ny_vehicles(vehicles_data)
    end
  end

  def create_wa_ev_vehicles(vehicles_data)
    vehicles_data.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin_1_10],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: vehicle[:model],
        engine: :ev
      })
    end
  end

  def create_ny_vehicles(vehicles_data)
    vehicles_data.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin],
        year: vehicle[:model_year],
        make: vehicle[:make],
        model: nil,
        engine: :ice
      })
    end
  end
end
