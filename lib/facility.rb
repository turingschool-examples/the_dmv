class Facility
  attr_reader :name, :address, :phone , :services, :registered_vehicles, :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
      if car.engine == :ev
        car.plate_type = :ev
      elsif car.antique?
        car.plate_type = :antique
      else
        car.plate_type = :regular
      end
  end
end
