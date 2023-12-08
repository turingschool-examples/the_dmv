class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(contact_info)
    @name = contact_info[:name]
    @address = contact_info[:address]
    @phone = contact_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle (vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      if vehicle.antique?
        @collected_fees += 25
        vehicle.plate_type = :antique
      elsif vehicle.engine == :ev
        @collected_fees += 200
        vehicle.plate_type = :ev
      else
        @collected_fees += 100
        vehicle.plate_type = :regular
      end
      vehicle.registration_date = Date.today
      @registered_vehicles
    else
      nil
    end
  end

  def administer_written_test (registrant)
    if @services.include?('Written Test') && registrant.age >= 16
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end

  
end
