class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  attr_writer :plate_type

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle) 
    if services.include?('Vehicle Registration') == false
      fee = 0
      return false
    elsif vehicle.antique?
      fee = 25
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      fee =  200
      vehicle.plate_type = :ev
    else
      fee = 100
      vehicle.plate_type = :regular
    end
    @registered_vehicles.push(vehicle)
    @collected_fees += fee
    vehicle
  end

  def administer_written_test(registrant) 
    if registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if registrant.license_data[:written] == true 
      true
      registrant.license_data[:license] = true 
    else
      false
    end
  end

  def renew_drivers_license(registrant) 
    if registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      registrant.license_data[:renewed] = false
    end
  end
end
