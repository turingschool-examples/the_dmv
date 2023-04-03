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
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle 
    
      vehicle.registration_date = Date.today
    
      if 
        vehicle.plate_type == :antique 
        @collected_fees += 25
      elsif 
        vehicle.plate_type == :ev 
        @collected_fees += 200 
      else 
        @collected_fees += 100 
      end

    else  
      @registered_vehicles = []
    end 
  end

  def administer_written_test(registrant)
    if registrant.permit? && registrant.age >= 16 && @services.include?("Written Test")
      true 
      
      registrant.license_data[:written] = true 
    else  
      false 
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true && @services.include?("Road Test")
      true 
      registrant.license_data[:license] = true
    else 
      false 
    end
  end
  
  
  def renew_drivers_license(registrant)
    if registrant.license_data[:license] == true && @services.include?("Renew License")
      true 
      registrant.license_data[:renewed] = true 
    else  
      false 
    end
    
  end

  

  

end
