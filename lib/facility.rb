class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(input)
    @name = input[:name]
    @address = input[:address]
    @phone = input[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
