class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(kwargs)
    @name = kwargs[:name]
    @address = kwargs[:address]
    @phone = kwargs[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
