class Facility
  attr_accessor :name, :address, :phone, :services, :facility, :registered_vehicles, :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @facility = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(vehicle)
    registered_vehicles << vehicle
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else 
      @collected_fees += 100
    end
  end
# After they collect the fees they still need to tell the vehicle "here's the registration"
  #** I know registration and type of registration.   



end
