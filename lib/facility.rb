class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :collected_fees, :register_vehicles

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = attributes[:services] || []
    @collected_fees = 0
    @register_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.register
    vehicle.set_plate_type
    @register_vehicles << vehicle
  end

  def calculate_fee(vehicle)
    if vehicle.plate_type == :ev
      @collected_fees += 200
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    else
      @collected_fees += 100
    end
  end
end
