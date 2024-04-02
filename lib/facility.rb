class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(args)
    @name = args[:name]
    @address = args[:address]
    @phone = args[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date == Date.today
     if vehicle.antique? == true
      @collected_fees += 25
      vehicle.plate_type = :antique
    
     elsif vehicle.electric_vehicle? == true
      @collected_fees += 200
      vehicle.plate_type = :ev
      
     else
      @collected_fees += 100
      vehicle.plate_type = :regular
     end

  

    # elsif @vehicle.engine = :ev
    #   @collected_fees += 200
    # elsif @vehicle.engine = :ice
    #   @collected_fees += 100
    #end 
  end

end
