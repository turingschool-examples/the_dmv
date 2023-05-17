class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(obj)
    @name = obj[:name]
    @address = obj[:address]
    @phone = obj[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
