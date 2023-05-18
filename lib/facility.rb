class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(info = {})
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if self.services.include?("Vehicle Registration") && vehicle.antique? == true
      @registered_vehicles << vehicle
      @collected_fees += 25
      vehicle.plate_type = :antique
      @registered_vehicles
    elsif self.services.include?("Vehicle Registration") && vehicle.electric_vehicle? == true
      @registered_vehicles << vehicle
      @collected_fees += 200
      vehicle.plate_type = :ev
      @registered_vehicles
    elsif self.services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      @collected_fees += 100
      vehicle.plate_type = :regular
      @registered_vehicles
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? == true && registrant.age >= 16 && self.services.include?("Written Test")
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end


end
