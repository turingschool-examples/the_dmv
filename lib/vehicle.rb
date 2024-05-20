require 'date'
class Vehicle
  
  # added the rest of the keys to attr_reader
  attr_reader :vin, :year, :make, :model, :engine
  attr_accessor :registration_date, :plate_type

  def initialize(vehicle_data)
    @vin = vehicle_data[:vin]
    @year = vehicle_data[:year]
    @make = vehicle_data[:make]
    @model = vehicle_data[:model]
    @engine = vehicle_data[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25 
  end

  def electric_vehicle?
    @engine == :ev
  end
end
