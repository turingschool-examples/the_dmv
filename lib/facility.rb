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




end
