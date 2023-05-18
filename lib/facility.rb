class Facility
  attr_reader :facility_details, :services

  def initialize(facility_details)
    @facility_details = facility_details
    @services = []
  end

  def name
    @facility_details.fetch(:name)
  end

  def address
    @facility_details.fetch(:address)
  end

  def phone
    @facility_details.fetch(:phone)
  end

  def add_service(service)
    @services << service
  end
end
