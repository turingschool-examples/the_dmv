class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

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

  def register_vehicle(vehicle)
    # return nil unless services.include?("Vehicle Registration")
    vehicle.registration_date = Date.today
    if vehicle.antique?
      @collected_fees += 25
    end

    @registered_vehicles << vehicle
    
    
    
    
   
    
    
    
    # Electric Vehicles (EV) cost $200 to register
    # All other vehicles cost $100 to register
    # A vehicle’s plate_type should be set to :regular, :antique, or :ev upon successful registration.
  end
end


  
