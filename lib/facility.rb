require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles

  #def initialize(name, address, phone) #<original entry>
  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    #add plate type and registration fees
    if vehicle.antique?
      vehicle.plate_type = :antique
      vehicle.registration_fee = 25
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
      vehicle.registration_fee = 200
    else
      vehicle.plate_type = :regular
      vehicle.registration_fee = 100
    end
  end

  def collected_fees #iterate through registered vehicles
    fee_total = 0
    @registered_vehicles.map do |vehicle|
      fee_total += vehicle.registration_fee
    end
    fee_total
  end
end
