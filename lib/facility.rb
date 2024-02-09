class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :collected_fees,
              :registered_vehicles

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle) 
    if @services.include? 'Vehicle Registration'
      @registered_vehicles << vehicle
    end
  end
end
