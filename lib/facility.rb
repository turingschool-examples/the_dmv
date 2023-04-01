class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(name:, 
                 address:, 
                 phone:
                 )
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = (0)
  end

  def add_services(service)
    @services << service
  end

  def register_vehicle(car)
    if car.plate_type == nil
      age = 2023 - car.year
      registered_vehicles << car
      car.register
      if age >= 25
        @collected_fees += 25
      elsif (age < 25) && (car.engine != :ev)
        @collected_fees += 100
      else
        @collected_fees += 200
      end
    else
      nil
    end
  end
end
