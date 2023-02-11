require 'date'
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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
    if @services.include? 'Vehicle Registration'
      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
      elsif vehicle.engine == :ev
        @collected_fees += 200
        vehicle.plate_type = :ev
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
      end
    else
      "This facility does not perform vehicle registration"
    end
  end

  def administer_written_test(registrant)
    if @services.include? 'Written Test'
      if registrant.age >= 16
        if registrant.permit
          registrant.license_data[:written] = true
          return true
        end
        false
      end
      false
    end
    false
  end
end
