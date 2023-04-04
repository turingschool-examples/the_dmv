class Facility
  attr_reader :name, :address, :phone,
              :services, :registered_vehicles, :collected_fees
              :administer_written_test
  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @administer_written_test
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil unless services.include?("Vehicle Registration")
    vehicle.register
    vehicle.registration_date == Date.today
    @collected_fees += fee_amount(vehicle)
     @registered_vehicles << vehicle
  end
  
  def fee_amount(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric_vehicle?
      200
    else
      100
    end
  end
  
  def administer_written_test(registrant)
    return false unless services.include?("Written Test")
    if registrant.age >= 16 && registrant.permit? == true
      registrant.license_data[:written] = true
    else 
      false
    end
  end

  def administer_road_test(registrant)
    return false unless services.include?("Road Test")
    if registrant.age >= 16 && registrant.license_data[:written]==true
      registrant.license_data[:license] = true
    else 
      false
    end
  end

  def renew_drivers_license(registrant)
    return false unless services.include?("Renew License")
    if registrant.age >= 16 && registrant.license_data[:license]==true
      registrant.license_data[:renewed] = true
    else 
      false
    end
  end
end

