class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    if car.electric_vehicle?
      car.plate_type = :ev
      collected_fees(200) 
      @registered_vehicles << car 
    elsif car.antique? 
      car.plate_type = :antique
      collected_fees(25)
      @registered_vehicles << car 
    else
      car.plate_type = :regular
      collected_fees(100) 
      @registered_vehicles << car 
    end
  end

  
end
