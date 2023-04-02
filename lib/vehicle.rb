require 'date'

class Vehicle
  attr_accessor :vin,
              :year,
              :make,
              :model,
<<<<<<< Updated upstream
              :engine
=======
              :engine,
              :registration_date,
              :plate_type,
              :registered
>>>>>>> Stashed changes

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
<<<<<<< Updated upstream
=======
    @registration_date = nil
    @plate_type = nil
    @registered = false
>>>>>>> Stashed changes
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

  # def get_registered
  #   @registered = true
  #   @registration_date = Date.today
  # end



end

   