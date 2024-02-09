class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(branch_info)
    @name = branch_info[:name]
    @address = branch_info[:address]
    @phone = branch_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    registered_vehicles << vehicle
    vehicle.update_registration_date
    vehicle.update_plate_type
    add_collected_fees(vehicle)
  end

  def add_collected_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end
end
