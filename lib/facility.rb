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
    return 'Service not available at this location.' unless 
    @services.include?('Vehicle Registration')
    @registered_vehicles << car
    car.registration_date = Date.today.to_s
    car.plate_type = check_plate_type(car)
    @collected_fees += check_registration_fees(car)
    car
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

  def administer_written_test(registrant)
    return 'Service not available at this location.' unless 
    @services.include?('Written Test')
    if eligible_for_written_test?(registrant) == true
      registrant.license_data[:written] = true
    else 
      'You are not eligible for a written test.'
    end
  end

  def eligible_for_written_test?(registrant)
    registrant.age >= 16 && registrant.permit?
  end

  def administer_road_test(registrant)
    return 'Service not available at this location.' unless 
    @services.include?('Road Test') 
    registrant.license_data[:written] ? registrant.
    license_data[:license] = true : 'Need to pass written test first.'
  end

  def renew_drivers_license(registrant)
    return 'Service not available at this location.' unless 
    @services.include?('Renew License')

    (registrant.license_data[:written] && registrant.license_data[:license]) ? registrant.
    license_data[:renewed] = true : 'Must have license.'
  end
end
