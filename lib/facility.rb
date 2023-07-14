class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_information)
    @name = facility_information[:name]
    @address = facility_information[:address]
    @phone = facility_information[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return if !self.services.include?("Vehicle Registration")
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    set_plate_type(vehicle)
    collect_fees(vehicle)
  end

  def set_plate_type(vehicle)
    if vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    elsif vehicle.antique?
      vehicle.plate_type = :antique
    else 
      vehicle.plate_type = :regular
    end
  end

  def collect_fees(vehicle)
    if vehicle.electric_vehicle?
      @collected_fees += 200
    elsif vehicle.antique?
      @collected_fees += 25
    else
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    return if !self.services.include?("Written Test")
    if registrant.age >= 16 && registrant.permit? == true
      registrant.license_data[:written] = true
    end
  end
end
