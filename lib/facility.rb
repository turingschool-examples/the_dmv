require 'date'

class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :add_service, :registered_vehicles, :collected_fees

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.antique? == true
      @collected_fees += 25
    elsif vehicle.electric_vehicle? == true
       @collected_fees += 200
    else @collected_fees += 100
    end
    @registered_vehicles << vehicle
  end

  # def plate_type(vehicle)
  #   if vehicle.antique? == true 
  #     @plate_type = :antique
  #   elsif vehicle.electric_vehicle == true
  #     @plate_type = :ev
  #   else  
  #     @plate_type = :regular
  #   end
  # end
end