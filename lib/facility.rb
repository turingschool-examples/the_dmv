class Facility
  
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name] || facility_hash[:title] || facility_hash[:office_name]
    @address =  facility_hash[:address] || facility_hash[:street_address_line_1] || facility_hash[:location_1]
    @phone = facility_hash[:phone] || facility_hash[:phone_number] || facility_hash[:public_phone_number]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration") && !@registration_date
      vehicle.add_registration
      @registered_vehicles << vehicle
      if vehicle.antique?
        @collected_fees += 25
        vehicle.add_plate(:antique)
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.add_plate(:ev)
      else
        @collected_fees += 100
        vehicle.add_plate(:regular)
      end
    else
      false
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.age >= 16 && registrant.permit?
        registrant.change_license_data(:written, true)
        true
      else
        false
      end
    else
      false
    end
  end
  
  def administer_road_test(registrant)
    if @services.include?("Road Test")
      if registrant.license_data[:written]
        registrant.change_license_data(:license, true)
        true
      else
        false
      end
    else
      false
    end
  end
  
  def renew_drivers_license(registrant)
    if @services.include?('Renew License')
      if registrant.license_data[:license]
        registrant.change_license_data(:renewed, true)
        true
      else
        false
      end
    else
      false
    end
  end
end
