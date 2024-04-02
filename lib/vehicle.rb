require 'date'
require './lib/facility'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :county

  attr_accessor :registration_date,
                :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
    @county = vehicle_details[:county]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if registration_date != nil
      if antique?
      @plate_type = :antique
      elsif electric_vehicle?
      @plate_type = :ev
      else
      @plate_type = :regular
      end
    end
  end
end
