class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :add_service, :registered_vehicles

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
end
