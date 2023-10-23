require 'date'

class Facility
  attr_accessor :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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

  def register_vehicle(vehicle)
    @vehicle = vehicle
    @facility = self
   
    # Need to check if vehicle has been registered at another facility. If it has, don't allow this method to run.

    @vehicle.registration_date = Date.today
    @facility.registered_vehicles << vehicle

    if @vehicle.antique?
      @vehicle.plate_type = :antique
      @facility.collected_fees += 25
    elsif @vehicle.electric_vehicle?
      @vehicle.plate_type = :ev
      @facility.collected_fees += 200
    else
      @vehicle.plate_type = :regular
      @facility.collected_fees += 100
    end
  end 

  def administer_written_test(registrant)
    @facility = self
    @registrant = registrant

    if @facility.services.include?('Written Test') && @registrant.permit? && @registrant.age >= 16
      @registrant.license_data[:written] = true
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    @facility = self
    @registrant = registrant

    if @facility.services.include?('Road Test') && @registrant.license_data[:written] == true
      @registrant.license_data[:license] = true
      true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    @facility = self
    @registrant = registrant

    if @facility.services.include?('Renew License') && @registrant.license_data[:license] = true
      @registrant.license_data[:renewed] = true
      true
    else
      false
    end
  end

end
