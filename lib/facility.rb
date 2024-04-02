
require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees,
              :plate_type

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @plate_type = :regular
  end

  def add_service(service) # adds a service (passed as an arguement into the service parameter) 
    @services << service # into the services instance variable, which is an array
  end

  def register_vehicle(vehicle) # add the registration date 6:46 pm
    if services.include?("Vehicle Registration")
      if vehicle.antique?
        @collected_fees += 25
        @registered_vehicles << vehicle
        vehicle.plate_type
        vehicle.assign_date
      elsif vehicle.electric_vehicle?    
        @collected_fees += 200 
        @registered_vehicles << vehicle
        vehicle.plate_type
        vehicle.assign_date
      else
        @collected_fees += 100
        @registered_vehicles << vehicle
        vehicle.plate_type
        vehicle.assign_date
      end
    end  
  end

end


