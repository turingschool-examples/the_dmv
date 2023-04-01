class Facility
  attr_reader :name, :address, :phone, :services, :date_of_registration, :vehicle_details, :registration_date
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
      registered_vehicles << vehicle
    else
      "registering not available"
    end
    # @vehicle.registration_date << Date.today.year
  end


end
