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
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @registered_vehicles = []
  end

  def collected_fees
    @collected_fees = 0 + @fee_sum.to_i
  end

  def register_vehicle(vehicle)
    @registered_vehicles = []
    @fee_sum = 0
     if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today
      fees_charged = {:antique => 25, :ev => 200, :regular => 100} 
      @fee_sum += fees_charged[vehicle.plate_type]
      @registered_vehicles << vehicle
      @registered_vehicles
    end
  end

end
