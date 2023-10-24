class VehicleFactory

  def create_vehicles(dmv_data_service)
    @vehicles = []
    dds = DmvDataService.new

    dds.wa_ev_registrations.each do |registration|
      @vin = [:vin_1_10]
      @year = [:model_year]
      @make = [:make]
      @model = [:model]

      new_vehicle = Vehicle.new({vin: @vin, year: @year, make: @make, model: @model, engine: :ev})

      @vehicles << new_vehicle
    end
    @vehicles
  end
  
end