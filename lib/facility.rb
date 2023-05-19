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
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
# Redo later? Add accessor to vehicle method and assign plate type from here as well?
  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.register
      if vehicle.antique?
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees += 100
      end
      @registered_vehicles << vehicle 
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.age >= 16 && registrant.permit?
        registrant.license_data[:written] = true
      end
    end
    registrant.license_data[:written]
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      end
    end
    registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License")
      if registrant.license_data[:license] == true
        registrant.license_data[:renewed] = true
      end
    end
    registrant.license_data[:renewed]
  end
end
