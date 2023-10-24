require 'date'
require 'pry'

class Vehicle
  attr_accessor :plate_type
  attr_reader :vin,
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
    @plate_type = nil
    @registration_date = nil 
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
  
  def new_registration_date
    @registration_date = (Time.now)
  end
end

