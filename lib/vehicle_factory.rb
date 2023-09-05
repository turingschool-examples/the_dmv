class VehicleFactory
  attr_reader :factory_vehicles,
              :vehicle_data,
              :api_data

  def initialize(engine = :ev)
    @factory_vehicles = []
    @api_data = DmvDataService.new.wa_ev_registrations
    @vehicle_data = {
      vin: nil,
      make: nil,
      model: nil,
      year: nil,
      engine: engine
      }
  end

  def create_vehicles(api_data)
    api_data.each do |data|
      vehicle = Vehicle.new(
        vin: data[:vin_1_10],
        make: data[:make],
        model: data[:model],
        year: data[:model_year],
        engine: @vehicle_data[:engine]
      )
      @factory_vehicles << vehicle
    end
  end
  @factory_vehicles
end


