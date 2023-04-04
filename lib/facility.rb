require 'date'

class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees
              

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.registration_date == nil 
      @registered_vehicles << vehicle
      @registration_date = vehicle.registration_date = Date.today
      if vehicle.antique?  
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees += 100
      end
    else 
      nil
    end
  end

  def administer_written_test(registrant)
    if !self.services.include?("Written Test") || registrant.age < 16
      false
    elsif self.services.include?("Written Test")
      registrant.license_data[:written] = true
      true
    end
  end

  def administer_road_test(registrant)
    if !self.services.include?("Road Test") 
      false
    elsif registrant.license_data[:written] == false
      false
    elsif self.services.include?("Road Test")
      registrant.license_data[:license] = true
    end
  end


# A road test can only be administered to registrants 
# who have passed the written test.

# For simplicity's sake, registrants who qualify for the road test 
# automatically earn a license.

  def renew_drivers_license(registrant)
    if !self.services.include?("Renew License") || registrant.license_data[:written] == false 
      false
    elsif self.services.include?("Renew License")
      registrant.license_data[:renewed] = true
    end
  end
end

# A license can only be renewed if the registrant 
# has already passed the road test and earned a license.