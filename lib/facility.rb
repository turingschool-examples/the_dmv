class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.age > 15 && registrant.permit?
        registrant.license_data[:written] = true
      end
    end
  end

end
