class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @registered_vehicles ||= []
  end

  def collected_fees
    @collected_fees ||= 0
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    if vehicle.antique?
      @collected_fees = collected_fees.to_i + 25
    elsif vehicle.electric_vehicle?
      @collected_fees = collected_fees.to_i + 200
    else
      @collected_fees = collected_fees.to_i + 100
    end
    @registered_vehicles << vehicle
  end
end
