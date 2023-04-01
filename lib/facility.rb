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

  def collected_fees
    @collected_fees
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    @registration_date = self.registered_vehicles[0].registration_date = Date.today
  end

  def registration_date
    @registration_date
  end

end
