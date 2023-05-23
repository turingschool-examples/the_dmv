class Facility

  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees,
              :services

  def initialize(office_details)
    @name = parse_name(office_details)
    @address = parse_address(office_details)
    @phone = parse_phone(office_details)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def register_vehicle(data)
    if @services.include?('Vehicle Registration')
    data.registration_date = Date.today
    @registered_vehicles.push(data)
      if data.antique? 
        data.plate_type = :antique
        @collected_fees += 25
      elsif
        data.electric_vehicle? 
        data.plate_type = :ev
        @collected_fees += 200
      else
        data.plate_type = :regular
        @collected_fees += 100
      end
      @registered_vehicles
    end
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(data)
    if @services.include?('Written Test')
      if data.permit? && data.age >= 16
          data.license_data[:written] = true
      end
    end
      data.license_data[:written]
  end

  def administer_road_test(data)
    if @services.include?('Road Test')
      if data.license_data[:written] == true
          data.license_data[:license] = true
      end
    end
      data.license_data[:license]
  end

  def renew_drivers_license(data)
    if @services.include?('Renew License')
      if data.license_data[:written] == true 
          data.license_data[:license] = true
            data.license_data[:renewed] = true
      end
    end
      data.license_data[:renewed]
  end

  def parse_name(office_details)
    if office_details[:name]
        office_details[:name]
    elsif office_details[:title] 
          office_details[:title] 
    elsif office_details[:office_name]
          office_details[:office_name]
    end
  end

  def parse_address(office_details)
    if office_details[:address]
        office_details[:address]
    elsif office_details[:location_1]
          address = Hash.new
          location_1 = JSON.parse office_details[:location_1][:human_address]
          address.store(:new_address, location_1)
          if office_details[:location_2]
            address_2 = Hash.new
                location_2 = JSON.parse office_details[:location_2][:human_address] 
                address_2.store(:b_suite, location_2['address'])
                address[:new_address]["b_suite"] = address_2[:b_suite]
          end
          address[:new_address].values.join(', ')
      end 
  end

  def parse_phone(office_details)
    if office_details[:phone]
      office_details[:phone]
    elsif office_details[:phone_number] 
          office_details[:phone_number]
    elsif office_details[:public_phone_number]
          office_details[:public_phone_number]
    end
  end
end
