require 'date'

class Vehicle
  attr_reader   :vin,
                :year,
                :make,
                :model,
                :engine,
                :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    case
      when antique? then :antique
      when electric_vehicle? then :ev
      else :regular
    end
  end

  def set_registration_date(date)
    @registration_date = date
  end
end
