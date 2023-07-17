require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
  attr_accessor :registration_date, :plate_type

  def initialize(details)
    @vin = details[:vin]
    @year = details[:year]
    @make = details[:make]
    @model = details[:model]
    @engine = details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year >= 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if electric_vehicle?
      :ev 
    elsif antique?
      :antique
    else
      :regular
    end
  end
end
