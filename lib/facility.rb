require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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
    if @services.include?(["Vehicle Registration"])
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

  
end
