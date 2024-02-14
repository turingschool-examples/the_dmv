require "./spec/spec_helper"

# The Facility class holds information about DMV facilities in a given state,
# including the name, address, phone, hours, and services available. This class
# has methods to register Vehicle objects, as well as issue written drivers
# exams and road tests to Registrant objects.
#
# Syntax:
#
# facility = Facility.new({
#   name: "John",
#   address: "123 Main St",
#   phone: "610-295-2954",
#   hours: "MTWThF 8:00AM - 5:00PM"
# })
#
# Methods:
#
# facility.add_service("service")
# facility.register_vehicle(Vehicle.new(...))
# facility.administer_written_test(Registrant.new(...))
# facility.administer_road_test(Registrant.new(...))
# facility.renew_drivers_license(Registrant.new(...))
class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles,
              :collected_fees, :hours

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone].to_s
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @hours = info[:hours]
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
