require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today
      vehicle.plate_type = set_plate_type(vehicle)
      @registered_vehicles << vehicle
      @collected_fees += vehicle.registration_fee(vehicle)
      @registered_vehicles
    else
      nil
    end
  end

  def set_plate_type(vehicle)
    # vehicle.plate_type = plate_type
    if vehicle.antique?
      vehicle.plate_type = :antique

    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev

    else
      vehicle.plate_type = :regular
    end
  end

  def calculate_registration_fee(vehicle)
    return 25 if vehicle.antique?
    return 200 if vehicle.electric_vehicle?
    100
  end
end
