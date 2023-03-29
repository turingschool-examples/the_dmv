class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_attributes)
    @name = facility_attributes[:name]
    @address = facility_attributes[:address]
    @phone = facility_attributes[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
