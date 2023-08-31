class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
