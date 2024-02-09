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
    @vin = vehicle_details[:vin_1_10]
    @year = vehicle_details[:model_year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = vehicle_details[:date]
    @plate_type = vehicle_details[:plate_type]
  end

  def change_to_ev
    @engine = :ev
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def update_registration_date
    @registration_date = Date.today
  end

  def update_plate_type
    if antique?
      @plate_type = :antique
    elsif electric_vehicle?
      @plate_type = :ev
    else
      @plate_type = :regular
    end
  end

  def registered?
    registration_date != nil
  end
end
