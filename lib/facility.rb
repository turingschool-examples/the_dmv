class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(name:, address:, phone:)
    @name                 = name
    @address              = address
    @phone                = phone
    @services             = []
    @registered_vehicles = []
    @collected_fees       = 0
    @fees                 = {ev: 200, antique: 25, regular: 100}
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    # when i register a vehichle, i want it to be given a registration date, a plate_type and i want it to pay_fees.
    @registered_vehicles << vehicle if @services.include?("Vehicle Registration")
    vehicle.registration_date = Date.today
    assigns_plates(vehicle)
    @collected_fees += @fees[vehicle.plate_type] if @registered_vehicles.include?(vehicle)
    @registered_vehicles
  end

  def assigns_plates(vehicle)
    if vehicle.electric_vehicle?      
      vehicle.plate_type = :ev     
    elsif vehicle.antique?
      vehicle.plate_type = :antique
    elsif vehicle.regular_vehicle?
      vehicle.plate_type = :regular
    end
  end

end
