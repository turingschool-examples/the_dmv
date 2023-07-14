class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(argument)
    @name = argument[:name]
    @address = argument[:address]
    @phone = argument[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
