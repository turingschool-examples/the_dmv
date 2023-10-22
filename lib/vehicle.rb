require 'date'

class Vehicle
  attr_accessor :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = vehicle_details[:registration_date]
    @plate_type = nil
  end

  # def registration_date
  #   @registration_date = nil
  # end
  
  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if antique? == true
      @plate_type = :antique
      :antique
    elsif electric_vehicle? == true
      @plate_type = :ev
      :ev
    else
      @plate_type = :regular
      :regular
    end
  end

end

