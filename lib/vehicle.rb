require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date,
              :plate_type

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def date_registered
    @registration_date = Date.today
  end

  def plate_finder
    if antique?
      :antique
    elsif electric_vehicle?
      :ev
    elsif @engine == :ice
      :regular
    else nil
    end
  end

  def registration_fee
    debt_collector = 0
    if antique?
      debt_collector += 25
    elsif electric_vehicle?
      debt_collector += 200
    else debt_collector +=100
    end
  end
end
