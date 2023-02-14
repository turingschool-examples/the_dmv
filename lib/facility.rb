require 'date'

class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :add_service, :registered_vehicles, :collected_fees, :plate_type

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') == true
      vehicle.registration_date = Date.today
      if vehicle.antique? == true
        @collected_fees += 25
      elsif vehicle.electric_vehicle? == true
        @collected_fees += 200
      else @collected_fees += 100
      end
      if vehicle.antique? == true 
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle? == true
        vehicle.plate_type = :ev
      else  
        vehicle.plate_type = :regular
      end
      @registered_vehicles << vehicle
    else 
      nil
    end
  end
    
  def administer_written_test(registrant)
    if @services.include?('Written Test') == true && registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true
      true
    else 
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') == true && registrant.license_data[:written] == true
      registrant.license_data[:license] = true 
      true
    else
      false
    end
  end
end