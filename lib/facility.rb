class Facility
  attr_reader :name, 
  :address,
  :phone,
  :services

  def initialize(info = {})
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
  end

  # can probably refactor this in to the initialization
  def add_service(services)
    @services << services
  end

  def registered_vehicles
    @registered_vehicles = []
  end

  def collected_fees
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    @registered_vehicles << (vehicle)
    vehicle.registration_date = Date.today

    
    
  end
end
