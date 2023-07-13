class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_information)
    @name = facility_information[:name]
    @address = facility_information[:address]
    @phone = facility_information[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
