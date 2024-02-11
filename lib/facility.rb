class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services,
              :registard_vehicles,
              :collected_fees

    def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registard_vehicles =[]
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    @registard_vehicles << car
  end
end
