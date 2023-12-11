class Facility
  attr_reader :name, :address, :phone, :services, :vehicle, :registered_vehicle, :collected_fees

  def initialize(facility_information)
    @name = facility_information[:name]
    @address = facility_information[:address]
    @phone = facility_information[:phone]
    @services = []
    @registered_vehicle = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicle << vehicle
      vehicle.car_registration_date
      collect_fees(vehicle)
      @registration_date = vehicle.car_registration_date
    end
  end

  def administer_written_test(registrant)
    if registrant.age >= 16 && @services.include?("Written Test") && registrant.permit?
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end


  def administer_road_test(registrant)
    if registrant.age >= 16 && @services.include?("Road Test") && registrant.permit? && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if registrant.age >= 16 && @services.include?("Renew License") && registrant.license_data[:license] = true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

end
