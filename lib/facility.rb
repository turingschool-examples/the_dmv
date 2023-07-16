class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  def initialize(information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.set_registration_date(Time.now)
    @registered_vehicles << vehicle
  end
end
