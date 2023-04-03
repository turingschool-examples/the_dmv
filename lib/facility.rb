class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  @@fees = {
    antique: 25, ev: 200,regular: 100
  }

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    @service
  end

  def register_vehicle(vehicle)
    return nil if !@services.include?('Vehicle Registration')

    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    if vehicle.antique?
      @collected_fees += @@fees[:antique]
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      @collected_fees += @@fees[:ev]
      vehicle.plate_type = :ev
    else
      @collected_fees += @@fees[:regular]
      vehicle.plate_type = :regular
    end
    @registered_vehicles
  end
end