class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def allow_registration
    if @services.include?('Vehicle Registration')

    end
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      if vehicle.antique?
        @collected_fees += 25
        vehicle.registration_date = Date.today.year
        vehicle.plate_type = :antique
      elsif vehicle.electric_vehicle? 
        @collected_fees += 200
        vehicle.registration_date = Date.today.year
        vehicle.plate_type = :ev
      else
        @collected_fees += 100
        vehicle.registration_date = Date.today.year
        vehicle.plate_type = :regular
      end
    else
    end
  end
end
