class VehicleFactory

  def initialize
  end

  def create_vehicles(dmv_data)
    dmv_data.map do |dmv_data|
      vehicle_info = {}
      vehicle_info[:vin] = dmv_data[:vin_1_10]
      vehicle_info[:year] = dmv_data[:model_year]
      vehicle_info[:make] = dmv_data[:make]
      vehicle_info[:model] = dmv_data[:model]
      vehicle_info[:engine] = :ev 
      Vehicle.new(vehicle_info)
    end
  

  end

end

# It looks to me like the DmvDataService is going to be getting you a bunch of data
#  from an API, and your job is to set up the VehicleFactory to take in that data
#  and use it to instantiate Vehicle objects with it. I would probably start by prying into 
# the DmvDataService near the end and seeing what format the data is that it's returning