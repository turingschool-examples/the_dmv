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

  def administer_written_test

  end

  def administer_road_test

  end

  def renew_drivers_license

  end

end
