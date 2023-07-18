class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  def initialize(information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.set_registration_date(Time.now)
      vehicle.set_plate_type
        if vehicle.plate_type == :antique
        @collected_fees += 25
        elsif vehicle.plate_type == :ev
        @collected_fees += 200
        else
        @collected_fees += 100
        end
      @registered_vehicles << vehicle
    else nil
    end
  end

  def administer_written_test(applicant)
    if @services.include?('Written Test') && applicant.age >= 16 && applicant.permit == true
      applicant.license_data[:written] = true
    else 
      applicant.license_data[:written]
    end
  end

  def administer_road_test(applicant)
    if @services.include?('Road Test') && applicant.license_data[:written] == true
      applicant.license_data[:license] = true
    else 
      applicant.license_data[:license]
    end
  end

  def renew_drivers_license(applicant)
    if @services.include?('Renew License') && applicant.license_data[:license] == true
      applicant.license_data[:renewed] = true
    else 
      applicant.license_data[:renewed]
    end
  end

  
end
