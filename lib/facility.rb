class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles
              
  attr_accessor :collected_fees

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
    car.registration_date = Date.today
    if car.antique?
      car.plate_type = :antique
      @collected_fees += 25
    elsif car.electric_vehicle?
      car.plate_type = :ev
      @collected_fees += 200
    else
      car.plate_type = :regular
      @collected_fees += 100
    end
    @registered_vehicles << car
  end


end
