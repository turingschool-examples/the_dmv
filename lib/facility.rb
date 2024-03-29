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
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    @registered_vehicles = []
    @collected_fees = 0
     if @services.include?("Vehicle Registration")
      vehicle.registration_date = Date.today
      if vehicle.antique?
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees += 100
      end
      @registered_vehicles << vehicle
      # fees_charged = {:antique => 25, :ev => 200, :regular => 100}
      # @collected_fees += fees_charged[vehicle.plate_type]
      # require 'pry';binding.pry
      @registered_vehicles
    end
  end

end
