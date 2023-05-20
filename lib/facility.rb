class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    valid_entries = ["Road Test", "Written Test", "Renew License", "Vehicle Registration"]
    unless service.is_a?(String) && valid_entries.include?(service)
      return "Invalid entry. Services offered are: #{valid_entries.join(", ")}"
    end
    @services << service
  end
  

  def register_vehicle(car)
    return "Service not available at selected location." unless services.include?("Vehicle Registration")
    if car.electric_vehicle?
      car.plate_type = :ev
      car.registration_date = Date.today.strftime("%Y-%m-%d")
      collect_cash(200) 
      @registered_vehicles << car 
    elsif car.antique? 
      car.plate_type = :antique
      car.registration_date = Date.today.strftime("%Y-%m-%d")
      collect_cash(25)
      @registered_vehicles << car 
    else
      car.plate_type = :regular
      car.registration_date = Date.today.strftime("%Y-%m-%d")
      collect_cash(100) 
      @registered_vehicles << car 
    end
  end

  def administer_written_test(person)
    return "Service not available at selected location." unless services.include?("Written Test")
    if person.age >= 16 && person.permit? 
      person.license_data[:written] = true 
    else 
      "#{person.name} does not qualify for written test."
    end 
  end 

  def administer_road_test(person)
    return "Service not available at selected location." unless services.include?("Road Test")
    if person.license_data[:written] == true 
      person.license_data[:drivers_license] = true
    else 
      "#{person.name} does not qualify for road test."
    end 
  end 

  def renew_drivers_license(person)
    return "Service not available at selected location." unless services.include?("Renew License")
    if person.license_data[:drivers_license] == true 
      person.license_data[:renewed] = true 
    else 
      "#{person.name} does not qualify for license renewal."
    end 
  end 

  def collect_cash(cash) 
    @collected_fees += cash
  end

end
