class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(options)
    @name = options[:name]
    @address = options[:address]
    @phone = options[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
