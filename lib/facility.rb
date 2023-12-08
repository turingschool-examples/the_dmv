class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(hash)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    create_plate(vehicle)
    vehicle.plate_type
    @registered_vehicles << vehicle 
  end 

  def register_fee(vehicle)
    case vehicle.plate_type
    when :antique 
      @collected_fees += 25
    when :ev 
      @collected_fees += 200 
    else 
      @collected_fees += 100
    end 
  end

  def create_plate(vehicle)
      if vehicle.antique? 
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
      else 
        vehicle.plate_type = :regular
      end 
  end 

end
