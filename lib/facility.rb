require "date"


class Facility
  attr_accessor :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  CurrentDate = Date.new(2023,10,19)

  def initialize(input)
    @name = input[:name]
    @address = input[:address]
    @phone = input[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = CurrentDate
    if vehicle.registered == false
      if vehicle.engine == :ev
        @collected_fees += 200
        vehicle.plate_type =:ev
      elsif vehicle.antique? == true
        @collected_fees += 25
        vehicle.plate_type = :antique
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
    @registered_vehicles << vehicle
    vehicle.registered = true
    vehicle
    end
  end
end
