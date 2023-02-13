class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end
  

  def add_service(service)
    @services << service
    return [service]
  end

  def register_vehicle(model)
    registered_vehicles << model
    return registered_vehicles
  end

  
end
