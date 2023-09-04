class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees, :plate_type

  def initialize(info, collected_fees = 0, plate_type = :regular)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = collected_fees
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if available_service?("Vehicle Registration")
    @registered_vehicles << vehicle
      if vehicle.antique?
        plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        plate_type = :ev
        @collected_fees += 200
      else
        @collected_fees += 100
      end
      vehicle.registration_date = Date.today 
    else
      puts "This facility does not offer vehicle registration services."
    end
  end

  def available_service?(service)
   @services.include?(service)
  end
end
