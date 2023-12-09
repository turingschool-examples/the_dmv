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
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date
    Date.today.year
    
  end

  def plate_type(
    :regular,
    :antique,
    :ev)
  
  if @engine == ice && registration_date = date.today.year > 25
    :antique
    #cost 25
  elsif @engine == ice && registration_date = date.today.year < 25
    :regular
    #cost 100
  else @engine == ev
    :ev
    #cost 200
  end

end
