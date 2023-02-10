class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
end
