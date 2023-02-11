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
    return nil unless @services.include?('Vehicle Registration')
    collect_fee(car.plate_type)
    car.set_registration_date(Date.today)
    @registered_vehicles << car
  end

  def administer_written_test(registrant)
    if (!@services.include?('Written Test') ||
       registrant.age < 16 ||
       !registrant.permit?)
      return false
    end
    registrant.set_license_data(:written, true)
    true
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
