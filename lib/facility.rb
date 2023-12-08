class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(hash)
    @name = hash[:name]
    # require 'pry' ; binding.pry
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
