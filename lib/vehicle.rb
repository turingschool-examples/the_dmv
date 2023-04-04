require 'date'
require './lib/dmv_data_service'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :vehicles_registered, :vehicle_details, :registration_date
  attr_accessor :vehicle_details
  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = vehicle_details[:registration_date]
    @plate_type = vehicle_details[:plate_type]
  end
  
  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if antique? == true
      @plate_type = :antique
    elsif electric_vehicle? == true
      @plate_type = :ev
    else
      @plate_type = :regular
    end
  end

end
