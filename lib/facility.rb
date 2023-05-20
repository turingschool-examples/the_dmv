

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  # facility_details = { :name, :address, :phone}

  def initialize(facility_details)
    @name = facility_details [:name]
    @address = facility_details [:address]
    @phone = facility_details [:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.is_registered = true
    @registered_vehicles << vehicle
    vehicle.register
  end
end
