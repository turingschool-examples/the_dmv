class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << car
      @collected_fees += 100
      car.registration_date = DateTime.now
    else
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit?
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
      true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Rewnew License") && registrant.license_data[:license] == true
      registrant.license_data[:renew] = true
      true
    else
      false
    end
  end
end
