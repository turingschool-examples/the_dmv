class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
