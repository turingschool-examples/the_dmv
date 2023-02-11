class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services
  attr_accessor :registered_vehicles

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
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle

      vehicle.registration_date = ("Date: 2023-01-12")
   
        if vehicle.antique?
          vehicle.plate_type = :antique
        elsif vehicle.electric_vehicle?
          vehicle.plate_type = :ev
        else vehicle.plate_type = :regular
        end
        @registered_vehicles
    end
  end

  
        # Here is where I was doing "too much" 
        # trying to do a loop method use {} etc. 
        #  And it was much more simple than that                                   
  

#   
    # The plate type is determined by the engine type OR year
    # Engine type is set in the vehicle class
    # When vehicle is registered it is assigned a plate type
    # I need to iterate over registered vehicles and assign 
      #plate based on engine type or year
    # And then possibly return that plate type value? 


end
