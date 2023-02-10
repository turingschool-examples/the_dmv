class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def collected_fees
    @collected_fees
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
  end

  def registration_date
    
    if @registered_vehicles != []
      @registration_date = ("Date: 2023-01-12") 
    end  
        # Here is where I was doing "too much" 
        # trying to do a loop method use {} etc. 
        #  And it was much more simple than that                                   

  end
  
  
  
end
