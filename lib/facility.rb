class Facility
  attr_reader :name, 
  :address, 
  :phone, 
  :services, 
  :registered_vehicles,
  :collected_fees

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @phone = params[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    registered_vehicles << vehicle
    
    if vehicle.year <= (Date.today.year - 25)
      vehicle.plate_type = :antique
    elsif  
      vehicle.engine == :ev
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

end
