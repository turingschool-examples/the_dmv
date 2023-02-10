class Facility
  # attr_reader :name, :address, :phone, :services
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
    @services = facility_details[:services]
    @services = []
    @registered_vehicles = facility_details[:registered_vehicles]
    @registered_vehicles = []
    @collected_fees = facility_details[:collected_fees]
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles.push(vehicle)
    if vehicle.antique?
      fee = 25
      @plate_type = :antique
    elsif vehicle.electric_vehicle?
      fee =  200
      @plate_type = :ev
    else
      fee = 100
      @plate_type = :regular
    end
    @collected_fees += fee
    vehicle
  end
end
