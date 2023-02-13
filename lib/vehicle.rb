require 'date'

class Vehicle
  attr_reader :vin, 
              :year, 
              :make, 
              :model, 
              :engine, 
              :zip
  attr_accessor :registration_date

  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @zip = vehicle_details[:zip]
  end

  def vin!(data)
    @vin = data
  end 

  def engine!(data)
    @engine = data 
  end

  def year!(year)
    @year = year
  end
  
  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  def registration_date
    registration_date = @registration_date
  end

  def year
    @year
  end


  def plate_type
    if @engine == :ev
      plate_type = :ev
    else
      if Date.today.year - @year > 25
        plate_type = :antique
      else 
        plate_type = :regular
      end
    end
  end
end
