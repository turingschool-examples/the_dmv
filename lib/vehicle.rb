require 'date'

class Vehicle
  attr_accessor :registration_date
  attr_reader   :vin,
                :year,
                :make,
                :model,
                :engine

              # :plate_type

  def initialize(vehicle_details, registration_date = nil, plate_type = nil)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = registration_date
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if Date.today.year - @year > 25
      @plate_type = :antique
    elsif @engine != :ev
      @plate_type = :regular
    elsif @engine == :ev
      @plate_type = :ev
    end
  end

end
