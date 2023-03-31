require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :registration_date
              :collected_fees

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @collected_fees = 0
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def register
    @registration_date = Date.today
  end

  def plate_type
    if antique? 
      :antique
    elsif electric_vehicle?
      :ev
    else
      :regular
    end
  end

  def collected_fees
    if antique?
      @collected_fees = 25
    elsif electric_vehicle?
      @collected_fees = 200
    else
      @collected_fees = 100
    end
  end
end
