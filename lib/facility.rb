class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.permit? == true
      registrant.license_data[:written] = true
    else
    end
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      add_registration(vehicle)
    else
    end
  end

  def add_registration(vehicle)
    @registered_vehicles << vehicle
    if vehicle.antique?
      @collected_fees += 25
      vehicle.registration_date = Date.today.year
      vehicle.plate_type = :antique
    elsif vehicle.electric_vehicle? 
      @collected_fees += 200
      vehicle.registration_date = Date.today.year
      vehicle.plate_type = :ev
    else
      @collected_fees += 100
      vehicle.registration_date = Date.today.year
      vehicle.plate_type = :regular
    end
  end

end
