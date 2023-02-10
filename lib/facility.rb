require './lib/vehicle'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    make_plate!(vehicle)
    @registered_vehicles << vehicle
    collect_fee(vehicle)
    vehicle
  end

  def make_plate!(vehicle)
    if vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    elsif vehicle.antique?
      vehicle.plate_type = :antique
    else
      vehicle.plate_type = :regular
    end
  end

  def collect_fee(vehicle)
    if vehicle.electric_vehicle?
      fee = 200
    elsif vehicle.antique?
      fee = 25
    else
      fee = 100
    end
    @collected_fees += fee
  end

end
