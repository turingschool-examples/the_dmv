class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @registered_vehicles ||= []
  end

  def collected_fees
    @collected_fees ||= 0
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today
      collect_fees(vehicle)
      change_plate(vehicle)
      registered_vehicles << vehicle
    else
      nil
    end
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees = collected_fees.to_i + 25
    elsif vehicle.electric_vehicle?
      @collected_fees = collected_fees.to_i + 200
    else
      @collected_fees = collected_fees.to_i + 100
    end
  end

  def change_plate(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.permit? == true && registrant.age >= 16
        registrant.license_data[:written] = true
        true
      else
        false
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
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
      if registrant.license_data[:license] == true
        registrant.license_data[:renewed] = true
      else 
        false
      end
    else
      false
    end
  end
end
