class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_info)
    @name = facility_info.fetch(:name)
    @address = facility_info.fetch(:address)
    @phone = facility_info.fetch(:phone)
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
