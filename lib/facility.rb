require 'spec_helper'

class Facility
  attr_reader :name, :address, :phone, :services,:registered_vehicles,
  :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone= facility_details[:phone]
    @services = []
    @registered_vehicles= [] 
    @collected_fees=0
  end

  def add_service(service)
     @services << service
     
  end

  def register_vehicle(vehicle)
    #It sets vehicle registeration date 
    vehicle.register
    # It adds an amount to collected fees  
    @collected_fees += 100
    # It add vehicle to register vehicle array 
    @registered_vehicles << vehicle 
  end 
end 

  
   


