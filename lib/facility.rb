class Facility
  attr_reader :name, :address, :phone, :services
  def initialize(facilities_info)
    @name = facilities_info[:name]
    @address = facilities_info[:address]
    @phone = facilities_info[:phone]
    @services = []
  end
  def add_service(service)
    @services << service
  end
end
