class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  def initialize(facilities_info)
    @name = facilities_info[:name]
    @address = facilities_info[:address]
    @phone = facilities_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  
  end
  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    vehicle
  end
  

  def collected_fees
    @registered_vehicles.sum { |vehicle| calculated_fees(vehicle) }

  end


  def calculated_fees(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric?
      200
    else
      100
    end
  end

end
 

