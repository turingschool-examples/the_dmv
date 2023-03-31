class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_attributes)
    @name = facility_attributes[:name]
    @address = facility_attributes[:address]
    @phone = facility_attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
    service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') &&
      vehicle.registration_date == nil
      
      @registered_vehicles << vehicle
      vehicle.set_registration_date
      collect_fees(vehicle)
      @registered_vehicles
    else
      nil
    end
  end

  def collect_fees(vehicle)
    total_fee = 0
    vehicle.set_plate_type
    if vehicle.plate_type == :antique
      total_fee += 25
    elsif vehicle.plate_type == :ev 
      total_fee += 200
    else
      total_fee += 100
    end
    @collected_fees += total_fee
    total_fee
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') &&
      registrant.read_license_data[:written] == false &&
      registrant.permit? == true &&
      registrant.age >= 16
      registrant.written_pass
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') &&
      registrant.read_license_data[:written] == true &&
      registrant.read_license_data[:license] == false &&
      registrant.age >= 16

      registrant.road_pass
    else
      false
    end
  end
end
