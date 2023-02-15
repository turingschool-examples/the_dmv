require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine,
              :plate_type

  attr_accessor :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year].to_s
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    if vehicle_details[:engine].downcase.include?("electric")
      @engine = :ev
    else
      @engine = :ice
    end

    @registration_date = nil
    if antique?
      @plate_type = :antique
    elsif electric_vehicle?
      @plate_type = :ev
    else
      @plate_type = :regular
    end
  end

  def antique?
    Date.today.year - @year.to_i > 25
  end

  def electric_vehicle?
    @engine = :ev if @engine.to_s.downcase.include?("electric") || @engine == :ev
    @engine == :ev
  end


end
