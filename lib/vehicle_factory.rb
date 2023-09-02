require_relative 'vehicle'

class VehicleFactory
  def create_vehicles(data)
    vehicles = []

    data.each do |d|
      next if d.has_key?(:record_type) && d[:record_type] != "VEH"

      d.transform_keys!(vin_1_10: :vin, model_year: :year)

      case
      when d.has_key?(:electric_vehicle_type) || d[:fuel_type] == "ELECTRIC"
        d[:engine] = :ev
      when d.has_key?(:fuel_type)
        d[:engine] = d[:fuel_type].downcase.to_sym
      else
        puts "Unrecognized engine type: #{d[:fuel_type]}"
      end


      vehicles << Vehicle.new(d)
    end

    return vehicles
  end
end
