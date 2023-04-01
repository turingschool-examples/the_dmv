require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle 
    vehicle.registration_date = Date.today
  end

  def collect_fees(vehicle)
    if 
      vehicle.plate_type == :antique 
       @collected_fees += 25
    elsif 
      vehicle.plate_type == :ev 
      @collected_fees += 200 
    else 
      @collected_fees += 100 
    end
  end

  

end
