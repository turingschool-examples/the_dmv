require 'date'
require 'pry'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type,
              :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = vehicle_details[:plate_type]
    @registration_date = vehicle_details[:registration_date]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registered?    
    !!plate_type && !!registration_date
  end


  #I've started working on this but am struggling with it.  This is where I told my pairing partner I need a break because I'm getting lost in everything.  
  # I think I may have to ammednd the above method also?
  
  def new_registration_date
    @registration_date = (Time.now)
  end
  


end
