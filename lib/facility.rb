class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(data)
    @name = data.fetch(:name)
    @address = data.fetch(:address)
    @phone = data.fetch(:phone)
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
