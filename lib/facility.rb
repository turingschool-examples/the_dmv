class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :add_service

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
