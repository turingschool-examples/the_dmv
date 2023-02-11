class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(info)
    # require'pry';binding.pry
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end
end
