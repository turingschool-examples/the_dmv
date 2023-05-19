class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @collected_fees = 0
    @registered_vehicles = []

  end

  def add_service(service)
    @services << service
  end
end
