class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles
  attr_writer :collected_fees


  def initialize(facility_info)
    @name = facility_info.fetch(:name)
    @address = facility_info.fetch(:address)
    @phone = facility_info.fetch(:phone)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') == true && vehicle.antique? == true
      vehicle.registration_date = Date.today
      @collected_fees += 25
      @registered_vehicles << vehicle
      vehicle.plate_type = :antique
    elsif @services.include?('Vehicle Registration') == true && vehicle.electric_vehicle? == true
      vehicle.registration_date = Date.today
      @collected_fees += 200
      @registered_vehicles << vehicle
      vehicle.plate_type = :ev
    elsif @services.include?('Vehicle Registration') == true
      vehicle.registration_date = Date.today
      @collected_fees += 100
      @registered_vehicles << vehicle
      vehicle.plate_type = :regular
    else @services.include?('Vehicle Registration') == false
    end
  end

  def accept_fees(int)
    @collected_fees += (int)
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') == true && registrant.permit == true && registrant.age >= 16
      return registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') == true && registrant.license_data[:written] = true
      return registrant.license_data[:license] = true
    else
      false
    end
  end
    
  def renew_drivers_license(registrant)
    if @services.include?('Renew License') == true && registrant.license_data[:license] == true
      return registrant.license_data[:renewed] = true
    else
      false
    end
  end
end








