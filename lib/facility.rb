require './lib/vehicle'
require './lib/registrant'
require './lib/facility_factory'

class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :collected_fees,
              :registered_vehicles,
              :daily_hours

  def initialize(input)
    @name = input[:name]
    @address = input[:address]
    @phone = input[:phone]
    @services = []
    @collected_fees = 0
    @plate_type = {}
    @registered_vehicles = []
    @daily_hours = input[:daily_hours]
  end

  def add_service(service)
    @services << service
  end

  def collect_fees(vehicle)
    if vehicle.plate_type == :ev
      @collected_fees  += 200
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    else
      @collected_fees += 100
    end
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
    else
      return
    end
  end

  def administer_written_test(registrant)
    return false if !@services.include?('Written Test')
    return false if !registrant.permit? || registrant.age < 16

    registrant.license_data[:written] = true
    true
  end

  def administer_road_test(registrant)
    return false if !@services.include?('Road Test')
    return false if !registrant.license_data[:written]

    registrant.license_data[:license] = true
    true
  end

  def renew_driver_license(registrant)
    return false if !@services.include?('Renew License')
    return false if !registrant.license_data[:license]

    registrant.license_data[:renewed] = true
    true
  end
end
