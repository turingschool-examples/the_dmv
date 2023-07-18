class Facility
  attr_reader :name, 
  :address,
  :phone,
  :services,
  :registered_vehicles,
  :collected_fees

  def initialize(info = {})
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(services)
    @services << services
  end

  def register_vehicle(vehicle)
    fees = 0
  
    if @services.include?('Vehicle Registration')
      
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle

      if vehicle.electric_vehicle?
        plate_type = :ev
        fees = 200
      elsif vehicle.antique?
        plate_type = :antique
        fees = 25
      else
        plate_type = (:regular)
        fees = 100
      end
    end
    
    vehicle.plate_type = plate_type
    @collected_fees += fees
    @registered_vehicles
    @registration_date
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") && registrant.permit
      registrant.license_data[:written] = true
    else 
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.permit
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.permit
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
