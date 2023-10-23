class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
              :registerd_vehicles

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registerd_vehicles = []
  end

  def add_service(service)
    @services << service
  end
end
