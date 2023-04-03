class Facility
  attr_accessor :name,
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

  def add_services(service)
    @services << service
  end

  def register_vehicle(vehicle)
    antique_fee = 25
    ev_fee = 200
    regular_fee = 100
    if !@services.include?('Vehicle Registration')
      nil
    elsif vehicle.antique? == true 
      vehicle.registered = true
      vehicle.registration_date = Date.today
      vehicle.plate_type = :antique
      @collected_fees += antique_fee
      @registered_vehicles << vehicle
     elsif vehicle.engine == :ev 
      vehicle.registered = true
      vehicle.registration_date = Date.today
      vehicle.plate_type = :ev
      @collected_fees += ev_fee
      @registered_vehicles << vehicle
     else 
      vehicle.registered = true
      vehicle.registration_date = Date.today
      vehicle.plate_type = :regular
      @collected_fees += regular_fee
      @registered_vehicles << vehicle 
    end
  end

  def administer_written_test(registrant)
    if !self.services.include?('Written Test') || registrant.age < 16
      false
    elsif self.services.include?('Written Test') && registrant.permit? == true
      registrant.license_data[:written] = true
    else
      registrant.license_data[:written] = false
    end
  end

  def administer_road_test(registrant)
    if !self.services.include?('Road Test')
      false
    elsif self.services.include?('Written Test') && registrant.license_data[:written] = true
      registrant.license_data[:license] = true
    else
      false
    end
  end
    
  def renew_drivers_license(registrant)
    if !self.services.include?('Renew License')
      false
    elsif self.services.include?('Renew License') && registrant.license_data[:license] == true && registrant.license_data[:written] == true 
      registrant.license_data[:renewed] = true
    else
      false
    end

  end


end