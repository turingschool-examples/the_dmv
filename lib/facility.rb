require 'date'

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
      vehicle.registration_date = Date.today
      reg_fees = {:antique => 25, :ev => 200, :regular => 100} 
      @collected_fees += reg_fees[vehicle.plate_type]
      @registered_vehicles << vehicle
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.age >= 16
        if registrant.permit?
        registrant.license_data[:written] = true
        end
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      if registrant.license_data[:written]
        registrant.license_data[:license] = true
      else
        false
      end
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License")
      if registrant.license_data[:license]
        registrant.license_data[:renewed] = true
      else
        false
      end
    else
      false
    end
  end

end
