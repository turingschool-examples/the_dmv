class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

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
    if @services.include?("Vehicle Registration")
      if vehicle.engine == :ev
        @collected_fees += 200
        vehicle.plate_type = :ev
      elsif vehicle.year >= 1998
        @collected_fees += 100
        vehicle.plate_type = :regular
      else vehicle.year <= 1998
        @collected_fees += 25
        vehicle.plate_type = :antique
      end
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    end
  end
    
  def administer_written_test(registrant)
    if @services.include?('Written Test') && registrant.age >= 16 && registrant.permit?
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.permit? && registrant.license_data[:written] == true
      registrant.license_data[:license] = true
    else
      false
    end
  end



end
