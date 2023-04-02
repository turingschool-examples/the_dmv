class Facility
  attr_accessor :name, 
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
    if @services.include?('Vehicle Registration')
      collect_fees(vehicle)
      vehicle.plate_type
      update_registration_date(vehicle)
      @registered_vehicles << vehicle
    end
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end
  
  def update_registration_date(vehicle)
    vehicle.registration_date = Date.today
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.qualifies_for_written_test? == true
      registrant.license_data[:written] = true
    else
      false
    end
  end



end


#register a vehicle
#Vehicles 25 years and older antiquest, $25
#EV $200
#all other $100

#plate_type = :regular, :antique, or :ev

#administer a written test
#must have permit
#must be 16 or older

#road test
#must have passed written test
#qualify for road test, you have a license

#renew license
#only if you've passed road test and have a license
