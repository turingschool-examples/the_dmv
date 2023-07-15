class VehicleFactory
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    data.each do |dmv_data|
      #iterate over each object in the DMV data set and pull
      #relevant value for corresponding keys and assign to keys in 
      #new vehicle objects.
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