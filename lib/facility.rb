class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees


  #change to look for keyword instead of positional 
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
   if @services.include?('Vehicle Registration')
    vehicle.register 
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else
      @collected_fees += 100
    end
    @registered_vehicles << vehicle
   end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      registrant.pass_test
    end
    registrant.license_data[:written]
  end

  # end of class
end
