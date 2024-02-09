class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(hash_data)
    @name = hash_data[:name]
    @address = hash_data[:address]
    @phone = hash_data[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
