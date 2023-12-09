class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facilities_details)
    @name = facilities_details[:name]
    @address = facilities_details[:address]
    @phone = facilities_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0

  end

  def add_service(service)
    @services << service
  end
  
 
  def register_vehicle(car)
    
    registered_vehicles << car if 
    @services.include?("Vehicle Registration")

  
  end 







end
