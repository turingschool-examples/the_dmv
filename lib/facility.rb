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
    @hours = facility_details[:hours]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return if !@services.include?("Vehicle Registration")
    if Date.today.year - vehicle.year >= 25
      plate = :antique
      @collected_fees += 25
    elsif vehicle.engine == :ev
      plate = :ev
      @collected_fees += 200
    else
      plate = :regular
      @collected_fees += 100
    end
    vehicle.register(plate)
    @registered_vehicles << vehicle
  end

  def administer_written_test(registrant)
    return false if !@services.include?("Written Test") || !registrant.permit? || !(registrant.age >= 16)
    registrant.license_data[:written] = true
  end

  def administer_road_test(registrant)
    return false if !@services.include?("Road Test") || !registrant.license_data[:written]
    registrant.license_data[:license] = true
  end

  def renew_drivers_license(registrant)
    return false if !services.include?("Renew License") || !registrant.license_data[:license]
    registrant.license_data[:renewed] = true
  end

end