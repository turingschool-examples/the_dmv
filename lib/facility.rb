class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles
  attr_accessor :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  #make sure I test this and write a test
  def set_plate_type(car)
    if car.antique? == true
      :antique
    elsif car.electric_vehicle? == true
      :ev
    else 
      :regular
    end
  end

  def register_vehicle(car)
    @registered_vehicles << car
    car.registration_date = Date.today
    car.plate_type = set_plate_type(car)
    if car.antique?
      @collected_fees += 25
    elsif car.electric_vehicle?
      @collected_fees += 325
    else 
      @collected_fees += 100
    end
  end
end

#services:
  # register a vehicle
  # administer a written test
  # administer a road test
  # renew a driver's license