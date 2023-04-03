require 'date'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine
  attr_accessor :plate_type, :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @vehicle_type = vehicle_details[:vehicle_type]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def set_plate
    if self.antique?
      return self.plate_type = :antique
    elsif self.electric_vehicle?
      return self.plate_type = :ev
    else
      return self.plate_type = :regular
    end
  end
end
