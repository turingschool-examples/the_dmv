class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(facilities_details)
    @name = facilities_details[:name]
    @address = facilities_details[:address]
    @phone = facilities_details[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
