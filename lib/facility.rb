class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil if !services.include?('Vehicle Registration')
    @registered_vehicles << vehicle
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    @collected_fees
  end

  def administer_written_test(registrant)
    return false unless services.include?('Written Test') && registrant.permit? && registrant.age >= 16
    registrant.license_data[:written] = true
    true
  end

  def administer_road_test(registrant)
    return false unless services.include?('Road Test')
    return false unless registrant.license_data[:written] && registrant.license_data[:license]
    registrant.license_data[:renewed] = true
    true
  end

end
