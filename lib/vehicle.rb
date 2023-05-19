class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type,
              :registration_date
            

  def initialize(vehicle_details)
    @engine = vehicle_details[:engine]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @plate_type = nil
    @registration_date = nil
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def assign_plate(type)
    @plate_type = type
  end

  def time_stamp
    @registration_date = Time.now
  end
end
