class Facility
  attr_reader   :name,
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

  def register_vehicle(vehicle)
    regular_vehicle_fee = 100
    ev_fee = 200
    antique_vehicle_fee = 25
    vehicle.registration_date = Date.today

    if vehicle.engine == :ev && @services.include?('Vehicle Registration')
      vehicle.plate_type = :ev
      @collected_fees += ev_fee
      registered_vehicles << vehicle
    elsif vehicle.antique? == true && @services.include?('Vehicle Registration')
      vehicle.plate_type = :antique
      @collected_fees += antique_vehicle_fee
      registered_vehicles << vehicle
    elsif @services.include?('Vehicle Registration')
      vehicle.plate_type = :regular
      @collected_fees += regular_vehicle_fee
      registered_vehicles << vehicle
    else
      nil
    end
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(registrant)
    if registrant.permit?
      registrant
      true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') && registrant.written_test_passed?
      registrant.take_road_test
      registrant.earn_license if registrant.road_test_passed?
      true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if services.include?('Renew license') && registrant.license?
      registrant.renew_license 
      true
    else
      false
    end
  end
end
