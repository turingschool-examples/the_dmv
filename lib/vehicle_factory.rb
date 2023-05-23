class VehicleFactory

  def create_vehicles(dmv_data)
    dmv_data.map do |vehicle_data|
      vehicle_data = vehicle_data.slice(:vin_1_10, :model_year, :make, :model)
      vehicle_data[:vin] = vehicle_data.delete(:vin_1_10)
      vehicle_data[:year] = vehicle_data.delete(:model_year)
      vehicle_data[:engine] = :ev
      Vehicle.new(vehicle_data)
    end
  end
end

#   def standardize_data(vehicle_data)
#     vehicle_data = vehicle_data.split(:vin_1_10, :model_year, :make, :model)
#     vehicle[:vin] = vehicle_data.delete(:vin_1_10)
#     vehicle[:model] = vehicle_data.delete(:model_year)
#     require 'pry'; binding.pry
#   end

#   def create_vehicles(dmv_data)
#     dmv_data.map do |vehicle_data|
#       filtered_data = standardize_data(vehicle_data)
#       Vehicle.new(vehicle)
#     end
#   end

# Vehicle.new({vin: registration[:vin_1_10], 
# year: registration[:model_year], etc, etc})