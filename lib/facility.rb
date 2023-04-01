class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
              :collected_fees, 
              :registered_vehicles

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
    date = Time.new.strftime("%d/%m/%Y")
    vehicle.registration_date = Time.new.strftime("%d/%m/%Y")
    
  #  new_array = @registered_vehicles.each do |vehicle|
  #     @registered_vehicles << vehicle
  #   end
  # @plate_type = vehicle.plate_type
  @registered_vehicles << vehicle
  
  # @registered_vehicles << vehicle
  @registered_vehicles
  # require 'pry'; binding.pry
  end




end
