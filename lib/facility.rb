class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

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
    if car.year <= 1998
      @collected_fees += 25
      car.plate_type = :antique
    elsif car.engine == :ev
      @collected_fees += 200
      car.plate_type = :ev
    else
      @collected_fees += 100
      car.plate_type = :regular
    end
    time = Time.now
    car.registration_date = time
    @registered_vehicles << car
  end
end
