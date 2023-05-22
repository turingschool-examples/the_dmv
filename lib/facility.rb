class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles =[]
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.add_registration_date(Date.today)
      vehicle.add_plate_type
      unless vehicle_registered?(vehicle)
        @registered_vehicles << vehicle
        vehicle.register
      end
    end
  end


  def collect_fees
    @registered_vehicles.each do |vehicle|
      if vehicle.plate_type == :regular
        @collected_fees += 100
      elsif vehicle.plate_type == :antique
        @collected_fees += 25
      else
        @collected_fees += 200
      end
    end
  end

  def vehicle_registered?(vehicle)
    @registered_vehicles.include?(vehicle)
  end

  def administer_written_test(registrant)
    @license_data ||= { written: false, license: false, renewed: false }
    if registrant.license_data[:written]
      @license_data[:written] = true
    end
    @license_data[:written]
  end

  def administer_road_test(registrant)
    if registrant.permit? && registrant.license_data[:written]
      if @services.include?('Road Test') || registrant.license_data[:license]
        registrant.license_data[:license] = true
      end
    end
    
    return registrant.permit? && registrant.license_data[:license]
  end

  def renew_drivers_license(registrant)
    if registrant.age > 15
      registrant.license_data[:renewed] = true
      true
      return registrant.license_data[:license] = true && registrant.license_data[:written] = true
    else
      false
    end
  end
end

