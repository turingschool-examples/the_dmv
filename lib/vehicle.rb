require 'date'

class Vehicle

  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

    #allow all data keys to fall under vehicle_details to call self
  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  #define differences to key for vehilces to fee can be applied appropriately
  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end


  #self refers to current object
  #aplies vehicle type when registering
  def register
    @registration_date = Date.today
    if self.electric_vehicle?
      @plate_type = :ev
    elsif self.antique?
      @plate_type = :antique
    else
      @plate_type = :regular
    end
  end

  #end class
end
