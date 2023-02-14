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
    @services << service
  end
  
  def register_vehicle(model)
    model.registration_date = Date.today
    if model.antique? && !model.electric_vehicle?
      model.plate_type = :antique
      @collected_fees += 25
    elsif model.electric_vehicle?
      model.plate_type = :ev
      @collected_fees += 200
    else
      model.plate_type = :regular
      @collected_fees += 100
    end
    registered_vehicles << model
  end

  def administer_written_test(registrant)
    return false if !@services.include?("Written Test")
    if registrant.age >= 16 && registrant.permit?
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    return false if !@services.include?("Road Test")
    if registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    return false if !@services.include?("Renew License")
    if registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      false
    end

  end

  

  
end
