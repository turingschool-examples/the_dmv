class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles
  attr_writer :collected_fees


  def initialize(facility_info)
    @name = parse_name(facility_info)
    @address = parse_address(facility_info)
    @phone = parse_phone(facility_info)
    @services = parse_services(facility_info)
    @registered_vehicles = []
    @collected_fees = 0
  end

  def parse_name(data)
    if data[:name]
      data[:name]
    elsif data[:dmv_office]
      data[:dmv_office]
    else data[:office_name] && data[:office_type]
      "#{data[:office_name]}, #{data[:office_type]}"
    end
  end
  
  def parse_address(data)
    if data[:address]
      data[:address]
    elsif data[:address_li] && data[:address__1] && data[:city] && data[:state] && data[:zip]
      "#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
    elsif data[:address_li] && data[:city] && data[:state] && data[:zip]
      "#{data[:address_li]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
    elsif data[:street_address_line_1] && data[:city] && data[:state] && data[:zip_code]
      "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}"
    else data[:address1] && data[:city] && data[:state] && data[:zipcode]
      "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}"

    end
  end
    
  def parse_phone(data)
    if data[:phone]
      data[:phone]
    else data[:public_phone_number]
      data[:public_phone_number]
    end
  end
  
  def parse_services(data)
    if data[:services_p]
      data[:services_p]
    else
      []
    end
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') == true && vehicle.antique? == true
      vehicle.registration_date = Date.today
      @collected_fees += 25
      @registered_vehicles << vehicle
      vehicle.plate_type = :antique
    elsif @services.include?('Vehicle Registration') == true && vehicle.electric_vehicle? == true
      vehicle.registration_date = Date.today
      @collected_fees += 200
      @registered_vehicles << vehicle
      vehicle.plate_type = :ev
    elsif @services.include?('Vehicle Registration') == true
      vehicle.registration_date = Date.today
      @collected_fees += 100
      @registered_vehicles << vehicle
      vehicle.plate_type = :regular
    else @services.include?('Vehicle Registration') == false
    end
  end

  def accept_fees(int)
    @collected_fees += (int)
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') == true && registrant.permit == true && registrant.age >= 16
      return registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') == true && registrant.license_data[:written] = true
      return registrant.license_data[:license] = true
    else
      false
    end
  end
    
  def renew_drivers_license(registrant)
    if @services.include?('Renew License') == true && registrant.license_data[:license] == true
      return registrant.license_data[:renewed] = true
    else
      false
    end
  end
end








