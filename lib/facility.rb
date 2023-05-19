class Facility
  attr_reader :address,
              :collected_fees,
              :name,
              :phone,
              :registered_vehicles, 
              :services

  def initialize(contact_info)
    @contact_info = contact_info
    @address = contact_info[:address]
    @collected_fees = 0
    @name = contact_info[:name]
    @phone = contact_info[:phone]
    @registered_vehicles = []
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.time_stamp
      
      if vehicle.antique? 
        vehicle.assign_plate(:antique) 
        @collected_fees += 25
      elsif vehicle.electric_vehicle? 
        vehicle.assign_plate(:ev)
        @collected_fees += 200
      else
        vehicle.assign_plate(:regular)
        @collected_fees += 100
      end
    else
      nil
    end
  end
end
