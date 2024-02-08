class Facility

  attr_reader :name, :address, :phone, :services

  def initialize(information)
    @name = name
    @address = address
    @phone = phone
    @services = []
  end

  def add_services(service)
    @services << service
  end

end
