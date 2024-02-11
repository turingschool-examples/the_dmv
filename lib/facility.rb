class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    collect_fees(vehicle)
    @registered_vehicles << vehicle
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end
end
