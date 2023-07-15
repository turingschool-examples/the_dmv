class VehicleFactory
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    data.each do |dmv_data|
      @vehicles << Vehicle.new({
        vin: dmv_data[:vin_1_10],
        year: dmv_data[:model_year],
        make: dmv_data[:make],
        model: dmv_data[:model],
        engine: :ev
       })
    end
    @vehicles
  end
end