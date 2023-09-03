class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  attr_accessor :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def set_plate_type(car)
    if car.antique? == true
      :antique
    elsif car.electric_vehicle? == true
      :ev
    else 
      :regular
    end
  end

  #helper method
  def check_for_service(service)
    @services.include?(service)
  end

  def register_vehicle(car)
    if check_for_service('Vehicle Registration') == true
      @registered_vehicles << car
      car.registration_date = Date.today
      car.plate_type = set_plate_type(car)
      if car.antique?
        @collected_fees += 25
      elsif car.electric_vehicle?
        @collected_fees += 200
      else 
        @collected_fees += 100
      end
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if check_for_service('Written Test') && registrant.permit? && registrant.age >= 16 
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if check_for_service('Road Test') && registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if check_for_service('Renew License') == true && registrant.license_data[:written] == true && registrant.license[:license] == true
    registrant.license_date[:renewed] = true
    end
  end
end

#services:
  # register a vehicle
  # administer a written test
  # administer a road test
  # renew a driver's license