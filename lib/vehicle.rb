require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details, registration_date = nil)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = registration_date
    @plate_type = set_plate_type
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def set_registration_date
    @registration_date = Date.today
  end

  def set_plate_type
    if  antique?
       :antique
    elsif  electric_vehicle?
       :ev
    else
        :regular
    end
  end

  def set_fees
    if set_plate_type == :antique
      25
    elsif set_plate_type == :ev
      200
    else
      100
    end
  end
end
