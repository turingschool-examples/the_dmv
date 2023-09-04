class VehicleFactory

  def initialize
  end

  def create_vehicles
    vehicle_data = DmvDataService.new.wa_ev_registrations
    vehicles = []
    vehicle_data.each do |vehicle|
      washed_vehicle = {
        vin:vehicle[:vin_1_10],
        year:vehicle[:model_year],
        make:vehicle[:make],
        model:vehicle[:model],
        engine:[:ev],
        registration_date:[:nil],
        plate_type:[:nil]}
      vehicles << Vehicle.new(washed_vehicle)
    end
    vehicles
  end
end