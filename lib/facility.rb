class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services

  def initialize(args)
    @name = args[:name]
    @address = args[:address]
    @phone = args[:phone]
    @services = []
    @registered_vehicles = {}
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.antique?
      cost = 25
      plate_type = :antique
    elsif vehicle.electric_vehicle?
      cost = 200
      plate_type = :ev
    else
      cost = 100
      plate_type = :regular
    end
  @registered_vehicles[vehicle] = {cost: cost, plate_type: plate_type}
  end

  def vehicle_registered?(vehicle)
    @registered_vehicles.key?(vehicle)
  end

end
