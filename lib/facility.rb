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
        registrant.pass_written_test
    end
    registrant.license_data[:written]
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
        registrant.earn_license
    end
    registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License")
        registrant.renew_license
    end
    registrant.license_data[:renewed]
  end
end
