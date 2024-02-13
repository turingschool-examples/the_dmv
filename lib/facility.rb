class Facility
  attr_reader :dmv_name, 
              :dmv_address, 
              :dmv_phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility)
    @dmv_name = ([:office_name] || [:dmv_office]) || [:name]
    @dmv_address = ([:street_address_line_1] || [:address_li]) || [:address1]
    @dmv_phone = [:public_phone_number] ||[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @fees = {antique: 25, ev: 200, regular: 100} 
  end

  #helper method I couldnt figure out

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
    if @services.include?('Written Test') && (registrant.permit && registrant.age >=16)
        registrant.license_data[:written] = true
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written]
      registrant.license_data[:license] = true
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    end
  end    
end
