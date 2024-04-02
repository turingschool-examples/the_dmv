class Facility
 
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registered
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  #A written test can only be administered to registrants with a 
  #permit and who are at least 16 years of age
  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.age >= 16 && registrant.permit? == true
      registrant.written_test_complete
      true 
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.road_test_complete
      true
    else
      false 
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] == true
      registrant.renewed_drivers_license
      true
    else
      false
    end
  end

  #A license can only be renewed if the registrant
  #has already passed the road test and earned 
 #a license

end
