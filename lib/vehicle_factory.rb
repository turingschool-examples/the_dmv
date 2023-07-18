class VehicleFactory
  attr_reader :created_vehicles
  
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(data)
    data.each do |dmv_data|
      @created_vehicles << Vehicle.new({
        vin: dmv_data[:vin_1_10],
        year: dmv_data[:model_year],
        make: dmv_data[:make],
        model: dmv_data[:model],
        engine: :ev
       })
    end
  end
end