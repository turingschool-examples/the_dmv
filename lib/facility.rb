require './lib/vehicle'
require './lib/registrant'
require 'date'

class Facility
  attr_reader :name, :address, :phone, :collected_fees, :registered_vehicles
  attr_accessor :services

  def initialize(hash, collected_fees = 0)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @collected_fees = collected_fees
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
    @services = @services.uniq
  end

   def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      if vehicle.registration_date == nil
        @registered_vehicles << vehicle
        vehicle.registration_date = Date.today
        if (vehicle.registration_date.year - vehicle.year) >= 25
          vehicle.plate_type = :antique
          @collected_fees+=25
        elsif vehicle.engine == :ev
          vehicle.plate_type = :ev
          @collected_fees+=200
        else
          vehicle.plate_type = :regular
          @collected_fees+=100
        end
        vehicle
      else
        "Oops! Looks like this vehicle has already been registered on #{vehicle.registration_date}."
      end
    else
    "Sorry, this location does not service vehicle registrations."
    end
   end

   def administer_written_test(registrant)
      if registrant.age >= 16 && registrant.permit == true
        registrant.license_data[:written]=true
        true
      else
        false
      end
   end

   

end

# binding.pry

# facility_1.administer_written_test(registrant_3)
