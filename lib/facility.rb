require './lib/vehicle.rb'

class Facility
  attr_accessor :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')    
      if vehicle.antique? == true
        @collected_fees = @collected_fees + 25
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
      elsif vehicle.engine == :ev
        @collected_fees = @collected_fees + 200
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
      else
        @collected_fees = @collected_fees + 100
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
      end
    else
      "This facility does not register vehicles."
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && @permit = true && registrant.age >= 16
      registrant.license_data.store(:written, true)
      true
    else
      registrant.license_data.store(:written, false)
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      if registrant.license_data.fetch(:written) == true
        registrant.license_data.store(:license, true)
        true
      else 
        registrant.license_data.store(:license, false)
        false
      end
    else
      registrant.license_data.store(:license, false)
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License')
      if registrant.license_data.fetch(:license) == true
        registrant.license_data.store(:renewed, true)
        true
      else 
        registrant.license_data.store(:renewed, false)
        false
      end
    else
      registrant.license_data.store(:renewed, false)
      false
    end
  end
end

