class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.set_plate_type
      vehicle.set_registration_date
      collect_fee(vehicle)
    end
  end
  
  def collect_fee(vehicle)
    fee = 0
    if vehicle.plate_type == :antique
      fee = 25
    elsif vehicle.plate_type == :ev
      fee = 200
    else
      fee = 100
    end
    @collected_fees += fee
  end
  
  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.old_enough?
      if registrant.permit?
        registrant.license_data[:written] = true
      else
        false
      end
    else
      false
    end
  end
  
  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      false
    end
  end
  
  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      false
    end
  end

end

#@facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })