class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      if vehicle.year >= 1998
        @collected_fees += 100
        vehicle.plate_type = :regular
      else vehicle.year <= 1998
        @collected_fees += 25
        vehicle.plate_type = :antique
      end
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    end
    
    
  end
    
    
  



end
