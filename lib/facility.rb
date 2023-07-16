class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(new_vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << new_vehicle
      new_vehicle.registration_date = Date.today
      if new_vehicle.antique?
        @collected_fees += 25
        new_vehicle.plate_type = :antique
      elsif new_vehicle.electric_vehicle?
        @collected_fees += 200
        new_vehicle.plate_type = :ev
      else
        @collected_fees += 100
        new_vehicle.plate_type = :regular
      end
      @registered_vehicles
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? && @services.include?("Written Test") && registrant.age >= 16
      registrant.license_data[:written] = true
    else
      registrant.license_data[:written]
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      registrant.license_data[:license]
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      registrant.license_data[:renewed]
    end
  end
end
