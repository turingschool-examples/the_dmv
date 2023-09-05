class Facility
  attr_accessor :name, 
                :address, 
                :phone, 
                :services,
                :registered_vehicles,
                :collected_fees

  def initialize(options)
    @name = options[:name]
    @address = options[:address]
    @phone = options[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end
    def register_vehicle(vehicle)
    if vehicle.antique?
      vehicle.plate_type = :antique
      vehicle.registration_date = Date.today
      @collected_fees += 25
    elsif vehicle.electric_vehicle? 
      vehicle.plate_type = :ev
      vehicle.registration_date = Date.today
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      vehicle.registration_date = Date.today
      @collected_fees += 100
    end
    @registered_vehicles << vehicle
  end
  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? && !registrant.license_data[:written]
      registrant.license_data[:written] = true
      return true
    else
       false
    end
  end
  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.permit? && registrant.license_data[:written] && !registrant.license_data[:license]
      registrant.license_data[:license] = true
      return true
    else
      return false
    end
  end
  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:written] && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
      return true
    else
      return false
    end
  end
  
end
