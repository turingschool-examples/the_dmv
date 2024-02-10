class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(hash_data)
    @name = hash_data[:name]
    @address = hash_data[:address]
    @phone = hash_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @fees = {antique: 25, ev: 200, regular: 100}
  end

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(vehicle) 
    if @services.include?('Vehicle Registration')
      vehicle.update_registration_date
      vehicle.assign_plate 
      @collected_fees += @fees[vehicle.plate_type]
      @registered_vehicles << vehicle
    else
      "Denied"
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit?
        registrant.license_data[:written] = true
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') 
      && registrant.permit?
      && registrant.license_data[:written]
       
      registrant.license_data[:license] = true
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    end
  end    
end
