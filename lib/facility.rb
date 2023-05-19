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
      collect_cash(200) 
      @registered_vehicles << car 
    elsif car.antique? 
      car.plate_type = :antique
      collect_cash(25)
      @registered_vehicles << car 
    else
      car.plate_type = :regular
      collect_cash(100) 
      @registered_vehicles << car 
    end
  end

  def collect_cash(cash) 
    @collected_fees += cash
  end

end
