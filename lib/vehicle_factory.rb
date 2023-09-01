class VehicleFactory
  attr_reader :off_the_lot

  def initialize
    @off_the_lot = []
  end

  def create_vehicles(data)
    data.each do |vehicle_data|
      # Create a new Vehicle instance and pass in the relevant attributes
      new_vehicle = Vehicle.new(
        vin: vehicle_data[:vin_1_10],
        year: vehicle_data[:model_year],
        make: vehicle_data[:make],
        model: vehicle_data[:model],
        engine: :ev
      )
      @off_the_lot << new_vehicle
    end
  end
end