require './lib/registrant'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :collected_fees, 
              :registered_vehicles

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @collected_fees = 0
    @registered_vehicles = []

  end

  def add_service(service)
    @services.push(service)
  end
  
  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles.push(vehicle)
      vehicle.registration_today(Date.today)
      if vehicle.electric_vehicle? == true
        vehicle.plate_version(:ev)
        @collected_fees += 200
        
      elsif vehicle.antique? == true
        vehicle.plate_version(:antique)
        @collected_fees += 25
      else #regular
        vehicle.plate_version(:regular)
        @collected_fees += 100
      end
    else
      nil
    end
  end
  def administer_written_test(student)
    if @services.include?('Written Test')
      license_data[:written] = true
      true
    else
      false
    end
  end
end
