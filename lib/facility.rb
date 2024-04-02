require "./lib/vehicle"
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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
    @registered_vehicles << vehicle
    @collected_fees += registration_fee(vehicle)
    @registration_date = Date.today

    return vehicle
  end

  def set_plate
      if vehicle.antique?
        vehicle.set_plate(:antique)
      elsif vehicle.electric_vehicle?
        vehicle.set_plate(:ev)
      else
        vehicle.set_plate(:regular)
      end
    end

  def registration_fee(vehicle)
    if vehicle.antique?
      @collected_fees += 25
      # vehicle.set_plate(:antique)
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
      # vehicle.set_plate(:ev)
    else 
      @collected_fees += 100
      # vehicle.set_plate(:regular)
    end
  end

end