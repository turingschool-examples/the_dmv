class Facility
  attr_reader :address,
              :name,
              :phone,
              :services,
              :collected_fees, 
              :registered_vehicles

  def initialize(office)
    @address = office[:address]
    @name = office[:name]
    @phone = office[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def register_vehicle(vehicle)
    
  end

  def add_service(service)
    @services << service
  end
end
