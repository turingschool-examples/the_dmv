class Facility
  attr_reader :name, :address, :phone, :services, :date_of_registration, :vehicle_details

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = facility_info[:services] = []
    @vehicles_registered = facility_info[:registered_vehicles] = []
    @fees_collected = facility_info[:collected_fees] = 0
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    return @vehicles_registered
  end

  def collected_fees
    return @fees_collected
  end

  def register_vehicle(vehicle)
    @vehicles_registered << vehicle
    @record_date
    return [vehicle]
  end


end
