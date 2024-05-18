class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      assign_registration_date(vehicle)
      assign_plate_type(vehicle)
      charge_fee(vehicle)
      @registered_vehicles << vehicle
    end
    false
  end

  def charge_fee(vehicle)
    if vehicle.plate_type == :regular
      @collected_fees += 100
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    else
      @collected_fees += 200
    end
  end

  def assign_plate_type(vehicle)
    if vehicle.engine == :ev
      vehicle.plate_type = :ev
    elsif vehicle.antique? == false
      vehicle.plate_type = :regular
    else
      vehicle.plate_type = :antique
    end
  end

  def assign_registration_date(vehicle)
    vehicle.registration_date = Date.today
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.age >= 16 && registrant.permit? == true
      registrant.license_data[:written] = true
    end
    false
  end

end
