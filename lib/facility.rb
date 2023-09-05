require 'date'

class Facility
  attr_reader :name, :address, :phone, :collected_fees

  attr_accessor :services, :registered_vehicles

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
    if @services.include?('Vehicle Registration')
       vehicle.registration_date = Date.today
       if vehicle.electric_vehicle? == true
         vehicle.plate_type = :ev
         @collected_fees += 200
       elsif vehicle.antique? == true
         vehicle.plate_type = :antique
         @collected_fees += 25
       else
         vehicle.plate_type = :regular
         @collected_fees += 100
       end
      @registered_vehicles << vehicle
    end
   end

   def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? == true && registrant.age >= 16
       registrant.license_data[:written] = true
      else
      return false
    end
  end
    
end
