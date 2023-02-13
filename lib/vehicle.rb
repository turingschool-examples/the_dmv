require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine
              # :registration_date,
              # :plate_type

  def initialize(vehicle_details, registration_date = nil, plate_type = nil)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    # @registration_date = registration_date
  end

  def antique?
    Date.today.year - @year > 25
    # require 'pry'; binding.pry
  end

  def registration_date
    if @registered_vehicles != []
    @registration_date = Date.today
    elsif @registered_vehicles = []
    @registration_date = registration_date
    end
  end

  def electric_vehicle?
    @engine == :ev
  end

  def plate_type
    if Date.today.year - @year > 25
      @plate_type = :antique
    elsif @engine != :ev
      @plate_type = :regular
    else @engine = :ev
      @plate_type = :ev
    end
  end

end
