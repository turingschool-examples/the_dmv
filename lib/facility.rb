class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(obj)
    @name = obj[:name]
    @address = obj[:address]
    @phone = obj[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle

    if vehicle.antique?
      @collected_fees += 25
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
      vehicle.plate_type = :ev
    else
    @collected_fees += 100
    vehicle.plate_type = :regular
    end
  end

  def administer_written_test(reg)
    if @services.include?('Written Test')
      reg.license_data[:written] = true
      true
    else
      false
    end
  end

end
