class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    @registered_vehicles << car
    car.registration_date = '2/9/2023'
    # fill in today's date?
    car.plate_type = check_plate_type(car)
    @collected_fees += check_registration_fees(car)
  end

  def check_plate_type(car)
    if 2023 - car.year >= 25
      :antique
    elsif car.engine == :ev
      :ev
    else
      :regular
    end
  end

  def check_registration_fees(car)
    if car.plate_type == :antique
      25
    elsif car.plate_type == :ev
      200
    else
      100
    end
  end

end
