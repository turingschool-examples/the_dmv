class Facility
  attr_reader :name, :address, :phone , :services, :registered_vehicles, :collected_fees

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
  end

  def register_vehicle(car)
    if @services.include?("Vehicle Registration")
        if car.engine == :ev
          car.plate_type = :ev
          @collected_fees += 200
        elsif car.antique?
          car.plate_type = :antique
          @collected_fees += 25
        else
          car.plate_type = :regular
          @collected_fees += 100
        end
      car.registration_date = Date.today
      @registered_vehicles.push(car)
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
        if registrant.age >= 16 && registrant.permit? == true
            registrant.license_data[:written] = true
        else 
          false
        end
    else
        false
    end
  end
end
