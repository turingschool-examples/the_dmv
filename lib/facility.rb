require "./spec/spec_helper"

# Documentation for class Facility
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles,
              :collected_fees

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = DateTime.now.strftime("%d/%m/%Y %H:%M")
    @collected_fees += vehicle.electric_vehicle? ? 200 : 100
    vehicle.plate_type = if (DateTime.now.year - vehicle.year) >= 25
                           :antique
                         elsif vehicle.electric_vehicle?
                           :ev
                         else
                           :regular
                         end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test") &&
       registrant.age >= 16 &&
       registrant.permit?
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test") && registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License") && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      false
    end
  end
end
