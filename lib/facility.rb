class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone= facility_details[:phone]
    @services = []
  end

  def add_service(services)
    @services << services
  end
end
