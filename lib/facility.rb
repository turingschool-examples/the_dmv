class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end
  

  def add_service(service)
    @services << service  ## adding service(s) to the services array
  end
  
  def register_vehicle(model)
    model.registration_date = Date.today ## setting the models registration date to today's date
    if model.antique? && !model.electric_vehicle?  ## if the model is antique and not an ev give antique plate type and and charge $25. Used the && to guard agiant potential future where EVs can be over 25 y/o
      model.plate_type = :antique
      @collected_fees += 25
    elsif model.electric_vehicle? ## if it's not antique and is an ev assign ev plate type, and charge $200
      model.plate_type = :ev
      @collected_fees += 200
    else
      model.plate_type = :regular ## if it's neither of the above give it regular plate type and charge accordingly
      @collected_fees += 100
    end
    registered_vehicles << model ## add the car to the registered vehicles
  end

  def administer_written_test(registrant)
    return false if !@services.include?("Written Test")  ## guard against administering the written test if services don't include written test
    if registrant.age >= 16 && registrant.permit? ## if registrant's age is appropriate and they have a permit allow the :written to be changed to true
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    return false if !@services.include?("Road Test")  ## guard against administering the road test if it is not included in services
    if registrant.license_data[:written]  ## if registrant has taken the written test, allow them to get thier license
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    return false if !@services.include?("Renew License")  ## guard against allowing rewnew license if it is not included in services 
    if registrant.license_data[:license] ## if registarant has their license, allow them to renew
      registrant.license_data[:renewed] = true
    else
      false
    end

  end

  

  
end
