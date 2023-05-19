class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees


  #change to look for keyword instead of positional 
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
   vehicle.register 
   @registered_vehicles << vehicle
  end
end
