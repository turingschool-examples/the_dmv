class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today

    @registered_vehicles << vehicle
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else 
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
      vehicle
    end
  end

  def administer_written_test(registrant)
    return false unless @services.include?('Written Test')
    return false if registrant.age < 16

    registrant.license_data[:written] = true
    true
  end

  def administer_road_test(registrant)
    return false unless @services.include?('Road Test')
    return false unless registrant.license_data[:written]

    registrant.license_data[:license] = true
    true
  end
end
