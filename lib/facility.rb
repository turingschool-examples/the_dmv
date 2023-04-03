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
    elsif self.services.include?("Written Test") == true
      registrant.license_data[:written] = true
      true
    end
  end
end
