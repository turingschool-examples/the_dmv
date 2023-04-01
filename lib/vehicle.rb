require 'date'

class Vehicle
  attr_reader   :vin,
                :year,
                :make,
                :model,
                :engine,
                :plate_type,
                :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = nil
    @registration_date = nil
  end

  def registration_date
    @registration_date
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def register
    @registration_date = Date.new
    plate
  end

  def plate
    age = 2023 - @year
    if (engine == :ice) && (age < 25)
      @plate_type = :regular
    elsif (engine == :ice) && (age >= 25)
      @plate_type = :classic
    else
      @plate_type = :ev
    end
  end

  def registration_date
    @registration_date
  end
end
