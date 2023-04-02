require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :collected_fees,
              :registered_vehicles

  def initialize(facility_details)
    @name                = facility_details[:name]
    @address             = facility_details[:address]
    @phone               = facility_details[:phone]
    @services            = []
    @collected_fees      = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      if vehicle.year <= 1998 and vehicle.engine == :ice
        # require 'pry'; binding.pry
        @collected_fees += 25
        vehicle.plate_type = :antique 
        @registered_vehicles << vehicle
        vehicle.registration_date = Date.today
        return @registered_vehicles
      elsif vehicle.year > 1998 and vehicle.engine == :ev
        @collected_fees += 200
        vehicle.plate_type = :ev
        @registered_vehicles << vehicle
        vehicle.registration_date = Date.today
        return @registered_vehicles
      elsif vehicle.year > 1998 and vehicle.engine == :ice
        @collected_fees += 100
        vehicle.plate_type = :regular
        @registered_vehicles << vehicle
        vehicle.registration_date = Date.today
        return @registered_vehicles
      end
    else 
      nil
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? == true && registrant.age >= 16
      if @services.include?('Written Test')
        registrant.license_data[:written] = true
        return true
      else
        return false
      end
    else
      false
    end
  end
end
