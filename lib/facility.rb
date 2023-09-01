class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
end

#services:
  # register a vehicle
  # administer a written test
  # administer a road test
  # renew a driver's license