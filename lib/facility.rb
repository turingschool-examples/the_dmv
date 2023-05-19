class Facility
  attr_reader :services

  def initialize(office)
    @office = office
    @services = []
  end

  def name
    @office[:name]
  end

  def address
    @office[:address]
  end

  def phone
    @office[:phone]
  end

  def add_service(service)
    @services << service
  end
end
