class VehicleFactory
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              
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

  def create_facilities(dmv_locations)
    locations = []
    dmv_locations.map do |location|
      locations << Facility.new(
        address: location[:title],
        phone: location[:zip_code],
        name: location[:agency],
      )
    end
    locations
  end

  def create_mo_facility(dmv_locations)
    mo_locations = []
    dmv_locations.map do |location|
      mo_locations << Facility.new(
        address: location[:address1],
        phone: location[:phone],
        name: location[:name],
      )
    end
    mo_locations
  end

  
end