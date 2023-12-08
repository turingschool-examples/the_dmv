class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
