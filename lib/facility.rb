class Facility
  attr_reader :name, :address, :phone, :registered_vehicles, :collected_fees
  attr_accessor :hours, :services
  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @hours = nil
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(new_vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << new_vehicle
      new_vehicle.registration_date = Date.today
      if new_vehicle.antique?
        new_vehicle.plate_type = :antique
        @collected_fees += 25
      elsif new_vehicle.electric_vehicle?
        new_vehicle.plate_type = :ev
        @collected_fees += 200
      else
        new_vehicle.plate_type = :regular
        @collected_fees += 100
      end
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? && registrant.age > 15
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license] == true
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
