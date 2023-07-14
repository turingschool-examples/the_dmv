class Facility
  attr_reader :name, :address, :phone, :services

  def initialize
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []
  end

  def add_services(service)
    @services << service
  end

  def offers_service?(service)
    @service.include?(service)
  end
end
