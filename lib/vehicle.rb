require 'date'

class Vehicle
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
    @engine = vehicle_details[:engine]
    @date_of_registration = vehicle_details[:registration_date]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def record_date(vehicle)
    vehicle_details[:registration_date] = Date.today.year
  end

  def registration_date
    return @vehicle_details[:registration_date]
  end

  def plate_type
    if antique? == true
      :antique
    elsif electric_vehicle? == true
      :ev
    else
      :regular
    end
  end
  
end
