class Facility
  
  attr_reader :name, :address, :phone, :services, :registered_vehicles

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
    if @services.include?("Vehicle Registration")
      if vehicle.antique?
        @collected_fees += 25
        vehicle.add_registration
        vehicle.add_plate(:antique)
        @registered_vehicles << vehicle
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.add_registration
        vehicle.add_plate(:ev)
        @registered_vehicles << vehicle
      else
        @collected_fees += 100
        vehicle.add_registration
        vehicle.add_plate(:regular)
        @registered_vehicles << vehicle
      end
    else
      "Service not offered at this location."
    end
  end
end
