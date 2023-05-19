class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicals

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicals = []
  end

  def add_service(service)
    @services << service
  end
end
