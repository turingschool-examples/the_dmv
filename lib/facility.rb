class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(info)
    @name = info[:name] || info[:dmv_office] || info[:office_name] 
    @address = info[:address] || info[:address_li] || info[:street_address_line_1] || info[:address1]
    @phone = info[:phone] || info[:public_phone_number] 
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if !@services.include?('Vehicle Registration')
      nil
    else
      vehicle.registration_date = Date.today.year
      @registered_vehicles << vehicle
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else 
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
    end
  end  

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.age >= 16 && registrant.permit? == true
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written] = true
      registrant.license_data[:license] = true 
    else
     false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:written] = true && registrant.license_data[:license] = true && registrant.age >= 16
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
