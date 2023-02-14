class VehicleFactory
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
  def initialize
  end

  def create_vehicles(dmv_data)
    cars = []
    dmv_data.each do |car|
      cars << Vehicle.new(
        engine: :ev,
        make: car[:make],
        model: car[:model],
        vin: car[:vin_1_10],
        year: car[:model_year]
      )
    end
    cars
  end   

  def create_facilities(dmv_data)
    locations = []
    dmv_data.each do |location|
      locations << Facility.new(
        title: location[:title],
        zip_code: location[:zip_code],
        website: location[:website],
        type: location[:type]
      )
    end
    locations
  end
end