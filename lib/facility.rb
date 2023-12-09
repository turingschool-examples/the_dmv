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
  
 
    def register_vehicle(vehicle)
      
      if @services.include?("Vehicle Registration")
      registered_vehicles << vehicle 

        if vehicle.antique?
          @collected_fees += 25
          vehicle.plate_type = :antique
        elsif vehicle.engine == :ev
          @collected_fees += 200
          vehicle.plate_type = :ev
        else
          @collected_fees += 100 
          vehicle.plate_type = :regular
        end
    
        if vehicle.registration_date = Date.today.year
        @registered_vehicle
        else 
          nil
        end
      end
   end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? && registrant.age >= 16 
      registrant.license_data[:written] = true
    end
  end
  
  def administer_road_test(registrant)
    if @services.include?("Road Test")  && registrant.license_data[:written]
      registrant.license_data[:license] = true
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License")  && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    end

  end
end
  