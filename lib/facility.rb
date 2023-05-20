class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_info)
    @name = facility_info[:name]
    @address = facility_info[:address]
    @phone = facility_info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?
    @registered_vehicles << vehicle
    vehicle.set_plate_type
    vehicle.set_registration_date
    collect_fee(vehicle)
  end

  def collect_fee(vehicle)
    fee = 0
    if vehicle.plate_type == :antique
      fee = 25
    elsif vehicle.plate_type == :ev
      fee = 200
    else
      fee = 100
    end
    @collected_fees += fee
  end


end


#todo = can track registered vehicles
#todo = can track collected fees - collect when reg vehicle
#todo = set plate type
#todo = fee based on antique?, EV, or regular
#todo = write logic so FAC will not reg a vehicle without that service


