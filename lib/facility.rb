class Facility
  attr_reader :name, :address, :phone, :hours, :holidays

  attr_accessor :services, :registered_vehicles, :collected_fees

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @hours = attributes[:hours]
    @holidays = attributes[:holidays]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    car.registration_date = Date.today.year

    @collected_fees += case
    when car.antique?
      car.plate_type = :antique
      25
    when car.electric_vehicle?
      car.plate_type = :ev
      200
    else
      car.plate_type = :regular
      100
    end

    @registered_vehicles << car
  end

  def administer_written_test(registrant)
    registrant.license_data[:written] = true if (registrant.age >= 16 && registrant.permit && @services.include?('Written Test'))
    return registrant.license_data[:written]
  end

  def administer_road_test(registrant)
    registrant.license_data[:license] = true if registrant.license_data[:written] && @services.include?('Road Test')
    return registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    registrant.license_data[:renewed] = true if registrant.license_data[:license] && @services.include?('Renew License')
  end
end
