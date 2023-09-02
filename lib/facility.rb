class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(new_vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << new_vehicle
      new_vehicle.registration_date = Date.today
      if new_vehicle.antique?
        new_vehicle.plate_type = :antique
        @collected_fees += 25
      elsif new_vehicle.electric_vehicle?
        new_vehicle.plate_type = :ev
        @collected_fees += 200
      else
        new_vehicle.plate_type = :regular
        @collected_fees += 100
      end
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      registrant.license_data[:written] = true
    end
  end
end
