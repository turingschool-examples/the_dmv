class Facility
  attr_reader :name, :address, :phone, :services, :registration_date, :vehicle_details
  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = facility_info[:services] = []
    @registered_vehicles = facility_info[:registered_vehicles] = []
    @collected_fees = facility_info[:collected_fees] = 0
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    return @registered_vehicles
  end

  def collected_fees
    return @collected_fees
  end

  def register_vehicle(vehicle)
    if services.include?('Vehicle Registration')
      if vehicle.plate_type == :antique
        @collected_fees += 25
        registered_vehicles << vehicle
        vehicle.registration_date = Date.today.year
      elsif vehicle.plate_type == :ev
        @collected_fees += 200
        registered_vehicles << vehicle
        vehicle.registration_date = Date.today.year
      elsif vehicle.plate_type == :regular
        @collected_fees += 100
        registered_vehicles << vehicle
        vehicle.registration_date = Date.today.year
      end
    else
      "registering not available"
    end
  end


end
