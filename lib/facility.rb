class Facility
  
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_hash)
    @name = facility_hash[:name]
    @address = facility_hash[:address]
    @phone = facility_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.add_registration
      @registered_vehicles << vehicle
      if vehicle.antique?
        @collected_fees += 25
        vehicle.add_plate(:antique)
      elsif vehicle.electric_vehicle?
        @collected_fees += 200
        vehicle.add_plate(:ev)
      else
        @collected_fees += 100
        vehicle.add_plate(:regular)
      end
    else
      "Service not offered at this location."
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
       if registrant.age >= 16 && registrant.permit?
        registrant.change_license_data(:written, true)
        true
       else
        false
       end
    else
      false
    end
  end
end
