class Facility
  attr_reader :name, 
              :phone, 
              :address, 
              :services,
              :collected_fees,
              :registered_vehicles
              
  def initialize(facility_info)
    @name = facility_info[:name]
    @phone = facility_info[:phone]
    @address = facility_info[:address]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration") 
      @registered_vehicles << vehicle # I don't understand why I have to add to @registered_vehicles
                                        # so it can set the date.
      vehicle.set_date
      if vehicle.antique?
        @collected_fees += 25
        vehicle.set_plate_type(:antique)
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.set_plate_type(:ev)
      else 
        @collected_fees += 100
        vehicle.set_plate_type(:regular)
      end
    end
  end

  def administer_written_test(registrant)
    if services.include?("Written Test") && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
    else
      false
    end
  end
  
  
  
  #   Administer a written test
  # A written test can only be administered to registrants with a permit and who are at least 16 years of age
  # Administer a road test
  # A road test can only be administered to registrants who have passed the written test
  # For simplicity’s sake, Registrants who qualify for the road test automatically earn a license
  # Renew a driver’s license
  # A license can only be renewed if the registrant has already passed the road test and earned a license
  # NOTE: A facility must offer a service in order to perform it. Just because the DMV allows facilities to 
  # perform certain services, does not mean that every facility provides every service.
  
end
#registration_date
#registered_vehicles
#collected_fees
#register_vehicle()
#plate_type
#add_service()
#services



# @facility_2
  # "New Driver's License"
  # "Road Test"
  # "Written Test"

# @facility_3
  # "New Drivers License"
  # "Road Test"
