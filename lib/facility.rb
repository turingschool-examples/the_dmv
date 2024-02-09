require "date"

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
end
