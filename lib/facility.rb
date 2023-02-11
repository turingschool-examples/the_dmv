class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :registered_vehicles, :collected_fees

  def initialize(name_address_phone)
    @name = name_address_phone[:name]
    @address = name_address_phone[:address]
    @phone = name_address_phone[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    if services.include?('Vehicle Registration')
      car.registration_date = Date.today
      new_plate!(car)
      @registered_vehicles << car
      # car.antique? ? @collected_fees += 25 : car.electric_vehicle? ? @collected_fees += 200 : @collected_fees += 100
      if car.antique?
        @collected_fees += 25
      elsif car.electric_vehicle?
        @collected_fees += 200
      else
        @collected_fees +=100
      end
    end
  end

  def new_plate!(car)
    if car.antique?
        car.plate_type = :antique
      elsif car.electric_vehicle?
        car.plate_type = :ev
      else
        car.plate_type = :regular
      end
  end
  
end

