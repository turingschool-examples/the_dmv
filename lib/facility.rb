class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
    0
  end

  def register_vehicle(vehicle)
    if vehicle.antique? 
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle? 
      vehicle.plate_type = :ev
    else 
      vehicle.plate_type = :regular
    end
    vehicle.registration_date = Date.today.year
    @registered_vehicles.push(vehicle)
  end
end
