class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles =[]
    @collected_fees = 0 
  end

  def add_service(service)
    #require 'pry';binding.pry
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle

      if vehicle.antique? 
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle? == true 
        vehicle.plate_type = :ev
        @collected_fees += 200
      else   
        vehicle.plate_type = :regular
        @collected_fees += 100  
      end 
      registered_vehicles
    end 
  end 

  def administer_written_test(registrant)
    if services.include?("Written Test") && registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true
    else 
      return false 

    end 
  end 
  def administer_road_test(registrant)
    #require 'pry';binding.pry
    if services.include?("Road Test") && registrant.permit? && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
 
    end 
    registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    #require 'pry';binding.pry
    if services.include?("Renew License") && registrant.permit? && registrant.license_data[:written] == true && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
 
    end 
    registrant.license_data[:renewed]
  end
end    


