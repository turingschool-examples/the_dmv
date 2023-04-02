require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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

  def register_vehicle(vehicle, service="Vehicle Registration")
    return nil unless self.performs_service?(service)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
    fee_type = vehicle.set_plate
    self.collect_fees(fee_type)
    @registered_vehicles
  end

  def administer_written_test(registrant, service="Written Test")
    return false unless self.performs_service?(service)
    if registrant.age >= 16 && registrant.permit? then registrant.license_data[:written] = true else false end
  end

  def administer_road_test(registrant, service="Road Test")
    return false unless self.performs_service?(service)
    if registrant.license_data[:written] then registrant.license_data[:license] = true else false end
  end

  def renew_drivers_license(registrant, service="Renew License")
    return false unless self.performs_service?(service)
    if registrant.license_data[:license] then registrant.license_data[:renewed] = true else false end
  end

  def performs_service?(service)
    true if @services.include?(service)
  end

  def collect_fees(plate_type)
    if plate_type == :ev
      @collected_fees += 200
    elsif plate_type == :antique
      @collected_fees += 25
    elsif plate_type == :regular
      @collected_fees += 100
    end
  end
end
