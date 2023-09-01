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
    elsif vehicle.electric_vehicle? == true
      vehicle.plate_type = :ev
      @collected_fees += 200
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
    end
  end

  def administer_written_test(person)
    if !@services.include?("Written Test")
      return false
    elsif person.age < 16 and person.permit? != true
    else
      person.license_data[:written] = true
      return true
    end
  end
end
