require './lib/vehicle'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(hash, collected_fees = 0)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @collected_fees = collected_fees
    @registered_vehicles = []
  end

  def add_service(service)
    unique_services = []
    unique_services << service
    @services = unique_services.uniq
  end

   def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      if vehicle.registration_date == nil
        @registered_vehicles << vehicle
        vehicle.registration_date = Date.today
        if (vehicle.registration_date.year - vehicle.year) >= 25
          vehicle.plate_type = :antique
        elsif vehicle.engine == :ev
          vehicle.plate_type = :ev
        else
          vehicle.plate_type = :regular
        end
        vehicle.registration_date
      else
        "Oops! Looks like this vehicle has already been registered on #{vehicle.registration_date}."
      end
    else
    "Sorry, this location does not service vehicle registrations."
    end
   end




end

require 'pry'; binding.pry