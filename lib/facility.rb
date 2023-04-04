class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  @@fees = {
    antique: 25, ev: 200,regular: 100
  }

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    @service
  end

  def register_vehicle(vehicle)
    return nil if !@services.include?('Vehicle Registration')

    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
      if vehicle.antique?
        @collected_fees += @@fees[:antique]
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle?
        @collected_fees += @@fees[:ev]
        vehicle.plate_type = :ev
      else
        @collected_fees += @@fees[:regular]
        vehicle.plate_type = :regular
      end
    @registered_vehicles
  end
  
  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
      return true
    else
      return false
    end
  end
  
  def administer_road_test(person)
    if administer_written_test(person)
      person.license_data[:license] = true
    else
      false
    end
  end
  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
      return true
    else
      return false
    end
  end
end