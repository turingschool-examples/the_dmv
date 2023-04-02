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
      if vehicle.model == "Cruz" 
        @collected_fees += 100
      elsif vehicle.model == "Bolt"
        @collected_fees += 225
      end
    else 
      nil
    end
  end
end
