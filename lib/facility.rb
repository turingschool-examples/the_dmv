class Facility
  attr_reader :name, :address, :phone,
              :services, :registered_vehicles, :collected_fees

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil unless services.include?("Vehicle Registration")
    vehicle.register
    @collected_fees += fee_amount(vehicle)
     @registered_vehicles << vehicle
  end
  
  def fee_amount(vehicle)
    if vehicle.antique?
      25
    elsif vehicle.electric_vehicle?
      200
    else
      100
    end
  end
  
  def administer_written_test(registrant)
    return false unless services.include?("Written Test")

    if registrant.age >= 16 && registrant.permit? == true
      true
    else 
      false
    end

  end
end
