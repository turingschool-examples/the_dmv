class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles

  def initialize(name:, address:, phone:)
    @name = name
    @address = address
    @phone = phone
    @services = []
    @collected_fees = 0
    @registered_vehicles = []
  end

  def add_service(service)
   return @services << service
  end

  def register_vehicle(vehicle)
    return @registered_vehicles << vehicle
    require 'pry'; binding.pry
    #adjust registration date in vehicle class    

  end

end
