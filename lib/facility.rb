class Facility
  attr_reader :name, :address, :phone, :services, :r_vehicles

  def initialize (information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @r_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @r_vehicles
  end

  def collected_fees
    0
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today

  end


end
