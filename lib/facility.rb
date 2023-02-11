class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    collect_fee(car.plate_type)
    car.registration_date = Date.today
    @registered_vehicles << car
  end

  private

  def collect_fee(plate)
    @collected_fees +=
    case plate
      when :antique then 25
      when :ev then 200
      else 100
    end
  end
end
