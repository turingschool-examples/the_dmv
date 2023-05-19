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
    return nil if !services.include?('Vehicle Registration')
    @registered_vehicles << vehicle
    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    @collected_fees
  end
end
