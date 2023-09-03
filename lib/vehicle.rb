require 'date'

class Vehicle
  attr_reader :vin,
              :year,
              :make,
              :model,
              :engine, 
              :registration_date 
  attr_writer :registration_date


  def initialize(vehicle_details)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = nil
    @plate_type = plate_type
  end

  def antique?
    Date.today.year - @year > 25
  end

  def electric_vehicle?
    @engine == :ev
  end

  


  def plate_type
    if @registration_date != nil && antique? == true
      return :antique
    elsif @registration_date != nil && electric_vehicle? == true
      return :ev
    elsif @registration_date != nil
      :regular
    else
      nil
    end
  end

  def pay_fee
    if antique? == true
      facility.collected_fees(25)
    elsif electric_vehicle? == true
      facility.collected_fees(200)
    else 
      facility.collected_fees << 100
    end
  end
  
end
