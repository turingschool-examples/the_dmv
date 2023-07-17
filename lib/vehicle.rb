require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  #tested
  def register_now
    @registration_date = Date.today
  end

  def issue_plate(plate_type)
    case plate_type
    when :antique
      @plate_type = :antique
    when :ev
      @plate_type = :ev
    when :regular
      @plate_type = :regular
    end
  end



end
