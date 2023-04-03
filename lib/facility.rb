class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    @services
  end


  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      @registered_vehicles << vehicle
      vehicle.update_registration_date
      @collected_fees += collection_fee_assignment[vehicle.plate_type]
      @registered_vehicles
    else 
      nil
    end
  end

  def collection_fee_assignment
    {
    :ev => 200,
    :antique => 25,
    :regular => 100
    }
  end

  def administer_written_test(registrant)
    return false if !@services.include?('Written Test')
    if registrant.age >= 16 && registrant.permit?
      registrant.update_written_test_status
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    return false if !@services.include?('Road Test')
    if registrant.license_data[:written] == true
      registrant.update_license_status
      true
    elsif registrant.license_data[:written] == false
      false
    end
  end

end
