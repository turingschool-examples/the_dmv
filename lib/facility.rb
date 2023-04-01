class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
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
   return @services << service
  end

  def register_vehicle(vehicle)
    date = Time.new.strftime("%d/%m/%Y")
    vehicle.registration_date = Time.new.strftime("%d/%m/%Y")
    
    return unless @services.include?('Vehicle Registration')
    @registered_vehicles << vehicle
    @plate_type = vehicle.plate_type
    @collected_fees += 100 if vehicle.plate_type == :regular
    @collected_fees += 25 if vehicle.plate_type == :antique
    @collected_fees += 200 if vehicle.plate_type == :ev
    @registered_vehicles
    
  end

  def administer_written_test(registrant)
    return false unless @services.include?("Written Test") 
    return false unless registrant.age >= 16
    return false unless registrant.permit?
    registrant.license_data[:written] = true
  end

  def administer_road_test(registrant)
    return false unless @services.include?("Road Test") 
    return false unless registrant.license_data[:written] == true
    registrant.license_data[:license] = true
    true
  end


end
