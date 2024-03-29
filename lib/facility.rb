class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @registered_vehicles = []
  end

  def collected_fees
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    @registered_vehicles = []
    @collected_fees = 0
    @registered_vehicles << vehicle
  end

end
