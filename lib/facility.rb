class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(hash)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    if @services.include?('Vehicle Registration')
      if car.antique?
        @collected_fees += 25
        car.plate_type = :antique
      elsif car.electric_vehicle?
        @collected_fees += 200
        car.plate_type = :ev
      else 
        @collected_fees += 100
        car.plate_type = :regular
      end
      car.registration_date = Date.today
      @registered_vehicles << car
      @registered_vehicles
    end
  end
  
  def administer_written_test(registrant)
    if @services.include?('Written Test')
      if registrant.permit? && registrant.age >= 16
        registrant.license_data[:written] = true
        registrant.license_data[:written]
      else 
        registrant.license_data[:written]
      end
    else 
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      if registrant.license_data[:written]
        registrant.license_data[:license] = true
      else
        registrant.license_data[:license]
      end
    else
      false
    end
  end
end
