class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.set_registration_date
      vehicle.set_plate_type
      @collected_fees += vehicle.set_fees
    else
      "service not provided at this location"
    end
  end

  def administer_written_test(person)
    if services.include?("Written_Test") && person.permit? == true && person.age >= 16
    person.license_data[:written] = true
    else 
      false
    end
  end
end
