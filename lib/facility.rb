class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility = {})
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
