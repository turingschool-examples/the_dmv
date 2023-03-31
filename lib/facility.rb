class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees
  def initialize(name:, address:, phone:)
    @name                = facility_info[:name]
    @address             = facility_info[:address]
    @phone               = facility_info[:phone]
    @services            = []
    @registered_vehicles = []
    @collected_fees      = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.registration_date = Date.today
    if vehicle.antique?
      @collected_fees += 25
    elsif vehicle.electric_vehicle
      @collected_fees += 200
    else 
      @collected_fees += 100
    end
    @registered_vehicles
  end

end
