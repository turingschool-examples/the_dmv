require './lib/vehicle'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services.append(service)
  end

  def register_vehicle(vehicle)
    @registered_vehicles.append(vehicle)
    vehicle.set_registration_date(DateTime.now)
    if vehicle.plate_type == :antique
      @collected_fees += 25
    end
    if vehicle.plate_type == :ev
      @collected_fees += 200
    end
    if vehicle.plate_type == :regular
      @collected_fees += 100
    end
  end
end