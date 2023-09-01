class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facility_details)
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_service(service)
    @services << service
  end

  # Here we go trying things


end
