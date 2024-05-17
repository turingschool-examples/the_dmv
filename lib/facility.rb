class Facility
  attr_reader :name, :address, :phone, :services
# changed to accept single argument as hash named facility_info
# added .fetch to use for default service value
  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = facility_info.fetch(:services, [])
  end
# add_services changed to add_service to pass test
  def add_service(service)
    @services << service
  end
end
