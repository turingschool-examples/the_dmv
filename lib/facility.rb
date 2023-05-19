require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

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
    #add plate type
    # if vehicle.antique?
    #   vehicle.plate_type = :antique
    #   vehicle.registration_fee = 25
    # elsif 
    # end
    #add registration fee
  end
end
