class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
  end

  def add_service(service)
    @services << service
    @service
  end

  def register_vehicle(vehicle)
    return nil if !@services.include?('Vehicle Registration')

    @registered_vehicles << vehicle
    require 'pry'; binding.pry
  end
end