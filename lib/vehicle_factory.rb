require './lib/vehicle'

class VehicleFactory
  def create_vehicles(data)
    data.map do |vehicle_data|
      Vehicle.new(
                   :vin=>vehicle_data[:vin_1_10],
                   :year=>vehicle_data[:model_year],
                   :make=>vehicle_data[:make],
                   :model=>vehicle_data[:model],
                   :engine=>:ev
                  )
    end
  end

  def create_vehicles_ny(ny_data)
    ny_data.map do |ny_vehicle_data|
      Vehicle.new(
                   :vin=>ny_vehicle_data[:vin],
                   :year=>ny_vehicle_data[:model_year],
                   :make=>ny_vehicle_data[:make],
                   :registration_date=>ny_vehicle_data[:reg_valid_date],
                   :engine=>ny_engine_type(ny_vehicle_data)
                  )
    end
  end

  def ny_engine_type(ny_vehicle_data)
    if ny_vehicle_data[:fuel_type] == "GAS" || ny_vehicle_data[:fuel_type] == "PROPANE"
      :ice
    elsif ny_vehicle_data[:fuel_type] == "ELECTRIC"
      :ev
    else
      nil
    end
  end
end
