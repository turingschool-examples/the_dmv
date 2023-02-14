class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  @@fees = {
    antique: 25,
    ev: 200,
    regular: 100
  }

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
    return false if !@services.include?('Written Test')

    if registrant.age >= 16 && registrant.permit?
      status = true
      registrant.license_data[:written] = true
    else
      status = false
    end
    status
  end

  def administer_road_test(registrant)
    return false if !@services.include?('Road Test')

    if registrant.license_data[:written]
      status = true
      registrant.license_data[:license] = true
    else
      status = false
    end
    status
  end

  def renew_drivers_license(registrant)
    return false if !@services.include?('Renew License')

    if registrant.license_data[:written] && registrant.license_data[:license]
      status = true
      registrant.license_data[:renewed] = true
    else
      status = false
    end
    status
  end
end
