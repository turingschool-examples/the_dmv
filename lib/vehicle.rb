require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date
  attr_accessor :plate_type


  vehicle_details = {:vin => :vin,
  :year => :year,
  :make => :make,
  :model => :model,
  :engine => :engine}
  
  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
    #@balance = 100
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end
end
