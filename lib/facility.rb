class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    facility_hash = {name: name, address: address, phone: phone}
  end

  def add_service(service)
    @services << service
  end
end
