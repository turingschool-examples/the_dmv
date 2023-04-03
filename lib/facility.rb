class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  @@fees = {
    antique: 25,
    ev: 200,
    regular: 100
  }

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
    @service
  end

  def register_vehicle(vehicle)
    return nil if !@services.include?('Vehicle Registration')

    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    @collected_fees += @@fees[:regular]
    @registered_vehicles
  end
end