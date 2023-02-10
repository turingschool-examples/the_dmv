class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(name_address_phone)
    @name = name_address_phone[:name]
    @address = name_address_phone[:address]
    @phone = name_address_phone[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
