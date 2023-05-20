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
    @services.push(service)
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
    @registered_vehicles.push(vehicle)
    vehicle.date_registered
    vehicle.plate_finder
    @collected_fees += vehicle.registration_fee
    else nil
    end
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test')
      if registrant.age >= 16 && registrant.permit?
        registrant.takes_written_test
      else false
      end
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test')
      if registrant.license_data[:written] && registrant.permit? 
        registrant.takes_road_test
      else false
      end
    end
  end

end
