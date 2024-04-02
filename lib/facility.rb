class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :hours,
              :holidays_closed,
              :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @hours = facility_hash[:hours]
    @holidays_closed = facility_hash[:holidaysclosed]
    @collected_fees = 0
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      registration_fee(vehicle)
      vehicle.update_registration_date
      vehicle.update_plate_type(vehicle)
      update_registered_vehicles(vehicle)
      
    else
      "Facility does not offer this service"
    end
  end

  def update_registered_vehicles(vehicle)
    @registered_vehicles << vehicle

  end

  def registration_fee(vehicle)
    if vehicle.antique?
      @collected_fees = 25
    elsif vehicle.electric_vehicle?
      @collected_fees = 200
    else
      @collected_fees = 100
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      registrant.license_data[:written] = true
    else
      "Facility does not offer this service"
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Driving Test') 
      if registrant.license_data[:written] == true
        return registrant.license_data[:license] = true
      else
        "applicant is not eligible for license"
      end
    else
      "Facility does not offer this service"
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('License Renewal') 
      if registrant.license_data[:license] == true
        return registrant.license_data[:renewed] = true
      else
        "applicant is not eligible for renewal"
      end
    else
      "Facility does not offer this service"
    end
  end

end