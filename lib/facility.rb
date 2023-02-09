class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @address = attributes.fetch(:address)
    @phone = attributes.fetch(:phone)
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
