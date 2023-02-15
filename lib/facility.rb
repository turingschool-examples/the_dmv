require_relative 'vehicle'
class Facility
  # attr_reader :name, :address, :phone, :services
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
    @services = facility_details[:services]
    @services = []
    @registered_vehicles = facility_details[:registered_vehicles]
    @registered_vehicles = []
    @collected_fees = facility_details[:collected_fees]
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles.push(vehicle)
    if services.include?('Register a vehicle') == false
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
    @collected_fees += fee
    vehicle.registration_date = Date.today
    vehicle
  end

  def administer_written_test(registrant)
    if services.include?('Written Test') == false 
      return false
    elsif registrant.permit == true && registrant.age >= 16
      registrant.license_data[:written] = true
    else
      return false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') == false
      return false
    elsif registrant.license_data[:written] == true 
      registrant.license_data[:license] = true
      return true
    else 
      return false
    end
  end

  def renew_license(registrant)
    if services.include?('Renew License') == false
      return false
    elsif registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
      return true
    else
      return false
    end
  end
end
