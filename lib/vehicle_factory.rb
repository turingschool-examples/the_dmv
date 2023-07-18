class VehicleFactory
  attr_accessor :registration_date,
  :plate_type
  attr_reader :vin, 
  :year,
  :make,
  :model,
  :engine

  def initialize
  end

  def create_vehicles(wa_data)
    storage_facility = []
    wa_data.each do |wa_car|
      data = {
        vin: wa_car[:vin_1_10],
        year: wa_car[:model_year],
        make: wa_car[:make],
        model: wa_car[:model],
        engine: :ev
      }
      vehicle = Vehicle.new(data)
      storage_facility << vehicle
    end

    storage_facility
  end
end