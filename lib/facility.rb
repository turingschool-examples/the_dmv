class Facility

  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def register_vehicle(data)
    @registered_vehicles.push(data)
    data.registration_date = Date.today
  end

  def add_service(service)
    @services << service
  end
end
