class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_values)
    @name = facility_values[:name]
    @address = facility_values[:address]
    @phone = facility_values[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
  end
end
