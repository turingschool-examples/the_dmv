class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
end
