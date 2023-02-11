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
      @collected_fees += 25
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
      vehicle.plate_type = :ev
    else
      @collected_fees += 100
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

    if registrant.license_data[:written] == true
      status = true
      registrant.license_data[:license] = true
    else
      status = false
    end
    status
  end
end
