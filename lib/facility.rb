class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

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

  def register_vehicle(vehicle)
    return nil unless @services.include?('Vehicle Registration')

    vehicle.registration_date = Date.today
    vehicle.determine_plate_type
    @registered_vehicles << vehicle
    calculate_collected_fees(vehicle)
    @registered_vehicles
  end

  def calculate_collected_fees(vehicle)
    plate_type_fees = {
      ev: 200,
      antique: 25
    }

    @collected_fees += plate_type_fees[vehicle.plate_type] || 100
  end

  def administer_written_test(registrant)
    return nil unless registrant.permit? && registrant.age > 15

    registrant.administer_written_test
  end
end
