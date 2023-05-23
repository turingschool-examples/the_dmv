class Facility
  attr_accessor :name,
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
    @services.include?('Vehicle Registration')
      collect_fees(vehicle)
      vehicle.registration_date = Date.today
      vehicle.set_plate_type
      @registered_vehicles << vehicle
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? == true && @services.include?('Written Test') && registrant.age >= 16
      registrant.license_data[:written] = true
    else
    false
    end
  end
end
