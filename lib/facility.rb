class Facility
  attr_reader :name,
              :address,
              :phone,
              :services

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
