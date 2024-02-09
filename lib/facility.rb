class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
end
