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
    nil.to_a
    @reg_array.to_a
  end

  def collected_fees
    @collected_fees = 0 + @fees_charged.to_i
  end

  def register_vehicle(vehicle)
    @reg_array = []
    @fees_charged = 0
     if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today
      reg_fees = {:antique => 25, :ev => 200, :regular => 100} 
      @fees_charged += reg_fees[vehicle.plate_type]
      @reg_array.push(vehicle)
    end
  end

end
