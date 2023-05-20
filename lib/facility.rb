class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registration_date,
              :collected_fees,
              :registered_vehicles

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
    @registered_vehicles << vehicle
    vehicle.registered_date
    vehicle.assign_plate
    add_collected_fees(vehicle)
    else
      nil
    end
  end

  def administer_written_test(registrant)
    if services.include?('Written Test') && registrant.permit?
      registrant.license_data[:written] = true
    else false
    end
  end

  def administer_road_test(registrant)
    if services.include?('Road Test') && registrant.written? 
      registrant.license_data[:license] = true
    else false
    end
  end

  def add_collected_fees(vehicle)
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      @collected_fees += 200
    else @collected_fees += 100
    end
  end
end

