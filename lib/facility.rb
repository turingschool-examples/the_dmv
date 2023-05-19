class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(data_hash)
    @name = data_hash[:name]
    @address = data_hash[:address]
    @phone = data_hash[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
