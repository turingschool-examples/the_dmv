require './lib/vehicle'

class VehicleFactory
  def create_vehicles(vehicles_data)
    case get_us_state(vehicles_data)
      when :WA then create_wa_ev_vehicles(vehicles_data)
      when :NY then create_ny_vehicles(vehicles_data)
      else nil
    end
  end

  private

  def get_us_state(vehicles_data)
    case
      when vehicles_data&.first&.dig(:state_of_residence) == 'WA' then :WA
      when vehicles_data&.first&.dig(:state) == 'NY' then :NY
      else nil
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
