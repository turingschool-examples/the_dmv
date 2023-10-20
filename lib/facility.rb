class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_values)
    @name = facility_values[:name]
    @address = facility_values[:address]
    @phone = facility_values[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
