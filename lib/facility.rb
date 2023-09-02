require 'date'

class Facility
  attr_accessor :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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
    return nil if !@services.include?("Vehicle Registration")
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      if vehicle.plate_type == :antique
        @collected_fees += 25
        elsif vehicle.plate_type == :ev
        @collected_fees += 200
        elsif vehicle.plate_type == :regular
        @collected_fees += 100
      end
    end
    @registered_vehicles
  end

  def collected_fees
    @collected_fees
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit? == true && registrant.age >= 16
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written] == true && registrant.license_data[:license] == false
      registrant.license_data[:license] = true
      true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license] == true && registrant.license_data[:renewed] == false
      registrant.license_data[:renewed] = true
      true
    else 
      false
    end
  end
  
end
