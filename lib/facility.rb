class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
# Redo later? Add accessor to vehicle method and assign plate type from here as well?
  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.register
      if vehicle.antique?
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees += 100
      end
      @registered_vehicles << vehicle 
    end
  end
end
