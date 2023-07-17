require "./lib/vehicle.rb"

class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.antique? == true
      registration_fee = 25
      vehicle.plate_type = :antique 
    elsif vehicle.electric_vehicle? == true
      registration_fee = 200
      vehicle.plate_type = :ev
    else 
      registration_fee = 100
      vehicle.plate_type = :regular
    end
  end

    # will likely need to add a value to change the @registration_date later

end