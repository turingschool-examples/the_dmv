require 'date'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility = {})
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
  
  def collect_fees(car)
    if car.plate_type == :regular
      @collected_fees += 100
    elsif car.plate_type == :ev
      @collected_fees += 200
    elsif car.plate_type == :antique
      @collected_fees += 25
    end
  end

  def register_vehicle(car)
    if @services.include?('Vehicle Registration')
      car.registration_date = Date.today
      car.plate_type
      collect_fees(car)
      @registered_vehicles.push(car)
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') == false
      false
    elsif registrant.age < 16 || registrant.permit? != true
      false
    else
      registrant.license_data[:written] = true
    end
  end
  
  def administer_road_test(registrant)
    if @services.include?('Road Test') == false
      false
    elsif registrant.license_data[:written] != true
      false
    else
      registrant.license_data[:license] = true
    end
  end
  
  def renew_drivers_license(registrant)
    if @services.include?('Renew License') == false
      false
    elsif registrant.license_data[:license] != true
      false
    else
      registrant.license_data[:renewed] = true
    end
  end
end
