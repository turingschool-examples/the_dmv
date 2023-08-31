class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

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

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.engine == :ev
      vehicle.plate_type = :ev
      @registered_vehicles << vehicle
      @collected_fees += 200
    elsif vehicle.registration_date.year - vehicle.year < 25
      vehicle.plate_type = :regular
      @registered_vehicles << vehicle
      @collected_fees += 100
    else
      vehicle.plate_type = :antique
      @registered_vehicles << vehicle
      @collected_fees += 25
    end
  end
end
