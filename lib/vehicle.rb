require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine

  attr_accessor :registration_date

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

  # def registration_date
  #   time = Time.new
  #   @registration_date = time.strftime("%d/%m/%Y")
  #   #this sets the intial test on 53 to return a date, not sure how to work around the attr_accessor yet
  # end

  def plate_type
    date = Time.new.strftime("%Y")
    return @plate_type = :antique if (date.to_i - @year) >= 25
    return @plate_type = :ev if @engine == :ev
    return @plate_type = :regular
    require 'pry'; binding.pry
    #@year - 25? = :antique (25+) $25
    #:ev = $200
    #everything else = $100
  end




end
