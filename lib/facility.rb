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
    @services.push(service)
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
    @registered_vehicles.push(vehicle)
    vehicle.date_registered
    vehicle.plate_finder
    else nil
    end
  end
end
