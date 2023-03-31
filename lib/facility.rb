class Facility
  attr_reader :name,
              :address,
              :phone,
              :services
  attr_accessor :registered_vehicles,
                :collected_fees

  def initialize(facility_details)
    @collected_fees = 0
    @name     = facility_details[:name]
    @address  = facility_details[:address]
    @phone    = facility_details[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.antique?
      vehicle.plate_type = :antique
      collected_fees += 100
    else
      vehicle.plate_type = :regular
    end
    @registered_vehicles << vehicle
  end
end
