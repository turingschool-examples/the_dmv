require 'date'

class Vehicle
  attr_reader :vin, :year, :make, :model, :engine, :plate_type
  attr_accessor :registration_date
              

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @plate_type = calculate_plate_type
    @registration_date =vehicle_details[:registration_date]
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric?
    @engine == :ev
  end

  def plate_type
    calculate_plate_type
  end


  def calculate_plate_type
    if antique?
      :antique
    elsif electric?
      :ev
    else
      :regular
    end
  end

end
