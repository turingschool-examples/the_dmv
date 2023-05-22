require 'date'

class Vehicle
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
    @registration_date = nil
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registered?
    @registered
  end

  def get_registered
    @registered = true
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


  # def registration_date
  #   if @vehicle.register_vehicle
  #     @registration_date = Date.today.year
  #     else nil
  #   end
  # end
end
