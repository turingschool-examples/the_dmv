class VehicleFactory
  def initialize
  end
  
  def create_vehicles(data_service)
    # vehicles = []
    data_service.map do |vehicle_data|
       Vehicle.new({
        vin: vehicle_data[:vin_1_10],
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev
      })
    end
  end
end
# vin = vehicle_details[:vin]
#     @year = vehicle_details[:year]
#     @make = vehicle_details[:make]
#     @model = vehicle_details[:model]
#     @engine = vehicle_details[:engine]