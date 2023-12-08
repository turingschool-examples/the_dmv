class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(contact_info)
    @name = contact_info[:name]
    @address = contact_info[:address]
    @phone = contact_info[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
