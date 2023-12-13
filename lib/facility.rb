class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(hash)
    # (hash) or (phonebook)
    @name = hash[:name]
    @address = hash[:address]
    @phone = hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration") 
      @registered_vehicles << vehicle
    end
    collect_fees(vehicle)
  end

  def collect_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle? 
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end
  
  def administer_written_test(registrant)
    if !@services.include?("Written Test") 
      false 
    else
      if registrant.permit? == true && registrant.age >= 16 
        registrant.license_data[:written] = true 
      end
    end
  end

end
