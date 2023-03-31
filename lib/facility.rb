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
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    collect_fees(vehicle)
    @registered_vehicles
  end

  def collect_fees(vehicle)
    total_fee = 0
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
end
