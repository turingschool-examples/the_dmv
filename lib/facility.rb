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
  end

  def register_vehicle(vehicle)
    unless services.include?('Vehicle Registration') != true
      vehicle.registration_date = Date.today
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
      @registered_vehicles << vehicle
    end
  end

  def administer_written_test(registrant)
    if services.include?('Written Test') && registrant.age >= 16 && registrant.permit?
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') && registrant.license_data[:written] 
      registrant.license_data[:license] = true
    else
      false
    end
  end
end
