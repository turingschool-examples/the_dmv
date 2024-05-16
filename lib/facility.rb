class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(attributes = {})
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
