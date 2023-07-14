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
    if Date.today.year - vehicle.year >= 25
      plate = :antique
    elsif vehicle.engine == :ev
      plate = :ev
    else
      plate = :regular
    end
    vehicle.register(plate)
    @registered_vehicles << vehicle
  end
end
