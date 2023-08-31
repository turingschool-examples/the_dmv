require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
  attr_accessor :registration_date,
                :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date
    @plate_type
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def register
    @registration_date = Date.today
    self.antique? ? @plate_type = :antique : @plate_type = :regular
    @plate_type = :ev if self.electric_vehicle?
  end
end
