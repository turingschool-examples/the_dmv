class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles

  attr_accessor :collected_fees


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

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today.year
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
      @registered_vehicles << vehicle
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      true
      if registrant.permit? == true && registrant.age >= 16
        registrant.license_data[:written] = true
      else
        registrant.license_data[:written] = false
      end
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      true
    else
      false
    end
  end
end
