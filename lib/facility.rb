class Facility
  attr_reader :name, :address, :phone, :services, :vehicle, :registered_vehicle

  def initialize(facility_information)
    @name = facility_information[:name]
    @address = facility_information[:address]
    @phone = facility_information[:phone]
    @services = []
    @registered_vehicle = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicle << Vehicle.new
  end


end
