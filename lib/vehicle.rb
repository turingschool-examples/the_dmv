require 'date'

class Vehicle
  attr_accessor :vin,
                :year,
                :make,
                :model,
                :engine,
                :registration_date,
                :plate_type
# perhaps only put :registration_date and :plate_type 
# in accessor

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = vehicle_details[:plate_type]
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    @plate_type = if antique? then :antique
    elsif self.engine == :ice then :regular 
      else :ev 
      end
  end

end
