class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(vehicle)
    # require 'pry'; binding.pry
    if !services.include?("Vehicle Registration")
      return nil
      if services.include?("Vehicle Registration")
        vehicle.registration_date = Date.today
        @registered_vehicles << vehicle
        if vehicle.antique?
          @plate_type = :antique
        elsif vehicle.electric_vehicle? == true
          @plate_type = :ev
        else @plate_type = :regular
        end
      end
    end
  end
end
