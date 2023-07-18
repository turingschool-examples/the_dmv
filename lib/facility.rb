require "./lib/vehicle.rb"
require "./lib/registrant.rb"
require "./lib/dmv_data_service"

class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :registered_vehicles, :collected_fees

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
      vehicle.registration_date = Date.today 
      @registered_vehicles << vehicle
      if vehicle.antique? == true
        @collected_fees += 25
        vehicle.plate_type = :antique 
      elsif vehicle.electric_vehicle? == true
        @collected_fees += 200
        vehicle.plate_type = :ev
      else 
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") == true && registrant.age >= 16 && registrant.permit == true
      registrant.license_data[:written] = true
    else 
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") == true && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else 
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") == true && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end

end