class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(hash)
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
    if !@services.include?("Vehicle Registration")
      return
    end

    @registered_vehicles << vehicle
    vehicle.register_vehicle
    
    if Date.today.year - vehicle.year >= 25
      vehicle.plate_type = :antique
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
    end
  end

  def administer_written_test(person)
    if person.age >= 16 && person.permit? && @services.include?("Written Test")
      person.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_rest(person)
    if person.license_data[:written] == true && @services.include?("Road Test")
      person.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(person)
    if person.license_data[:license] == true && @services.include?("Renew License")
      person.license_data[:renewed] = true
    else
      false
    end
  end
end
