class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  def initialize(facilities_info)
    @name = facilities_info[:name]
    @address = facilities_info[:address]
    @phone = facilities_info[:phone]
    @services = []
    @registered_vehicles = []
  
  end
  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    
    @registered_vehicles << vehicle
    
    
  end
  
  # vehicle.plate_type = determine_plate_type(vehicle)

  # registration_fee = calculate_registration_fee(vehicle)
  # collect_fee(registration_fee)


  # def calculate_registration_fee(vehicle)
  #   if vehicle.antique?
  #     25
  #   elsif vehicle.electric?
  #     200
  #   else
  #     100
  #   end
  # end

  # def determine_plate_type(vehicle)
  #   if vehicle.antique?
  #     :antique
  #   elsif vehicle.electric?
  #     :ev
  #   else
  #     :regular
  #   end
  # end

  # def collect_fee(amount)
  #   @collected_fees += amount
  # end
 
end
 

