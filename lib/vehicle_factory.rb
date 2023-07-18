class VehicleFactory
  attr_accessor :registration_date,
  :plate_type
  attr_reader :vin, 
  :year,
  :make,
  :model,
  :engine

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine] = :ev
    @registration_date = nil
    @plate_type = nil
  end

end