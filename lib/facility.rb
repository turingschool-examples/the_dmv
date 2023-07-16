class Facility
  attr_reader :name, 
  :address,
  :phone,
  :services,
  :registered_vehicles,
  :collected_fees

  def initialize(info = {})
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(services)
    @services << services
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle

    if vehicle.electric_vehicle?
      plate_type = :ev
      collected_fees = 200
    elsif vehicle.antique?
      plate_type = :antique
      collected_fees = 25
    else
      plate_type = :regular
      collected_fees = 100
    end

    @collected_fees += collected_fees
    @registered_vehicles
    @registration_date
  end
end
