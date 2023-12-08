class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(hash)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    vehicle.plate_type(vehicle)
    @registered_vehicles << vehicle 
  end 

  def register_fee(vehicle)
    plate_type = vehicle.plate_type

    case plate_type 
    when :antique 
      @collected_fees += 25
    when :ev 
      @collected_fees += 200 
    else 
      @collected_fees += 100
    end 
  end


end
