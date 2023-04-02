class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

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
    fee = 100
    if vehicle.year <= Date.today.year - 25
      vehicle.plate_type = :antique
      fee = 25
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
      fee = 200
    else
      vehicle.plate_type = :regular
    end
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    @collected_fees += fee
    @registered_vehicles
  end

  # def collected_fees

  # end
end
