class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(hash)
    @hash = hash.each{ |key, value| instance_variable_set("@#{key}", value) }
    @services = []
  end

  def add_services(service)
    @services << service
  end
end
