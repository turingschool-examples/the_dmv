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
  # aministering a written test is being called on a Facility object.
  def administer_written_test(registrant)
    registrant.license_data[:written] = true if eligible?(registrant)
    eligible?(registrant)
  # last line of code needs to call for a return.
  end
                              # registrant, in this instance, is a local parameter.
  def administer_road_test(registrant)
    # if by default looks for a boolean value of "true"
   registrant.license_data[:license] = true if eligible?(registrant) && registrant.license_data[:written]
   registrant.license_data[:written] && eligible?(registrant)
  end

  def eligible?(registrant)
    registrant.permit? && registrant.age >= 16 && (@services.include?("Written Test") || @services.include?("Road Test"))
  end
end
