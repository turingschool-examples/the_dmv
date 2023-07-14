require 'date'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(details)
    @name = details[:name]
    @address = details[:address]
    @phone = details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      set_plate_type(vehicle)
      collect_registration_fees(vehicle)
    end
  end

  def set_plate_type(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def collect_registration_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true
    end
  end
end
