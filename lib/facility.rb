require 'date'

class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
              :registered_vehicles, 
              :collected_fees

  def initialize(info_hash)
    @name = info_hash[:name]
    @address = info_hash[:address]
    @phone = info_hash[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    return nil if !@services.include?("Vehicle Registration")
    if vehicle.antique?
      vehicle.plate_type = :antique
      @collected_fees += 25
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
      @registered_vehicles
    elsif
      vehicle.electric_vehicle?
      vehicle.plate_type = :ev
      @collected_fees += 200
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
      @registered_vehicles
    else
      vehicle.plate_type = :regular
      @collected_fees += 100
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
      @registered_vehicles
    end
  end
end






# Register a vehicle
# Vehicles have the following rules:
# Vehicles 25 years old or older are considered antique and cost $25 
# to register / The vehicle.rb has a test for this and it is working for this
# facility class

# Electric Vehicles (EV) cost $200 to register / The vehicle.rb has a test for this
# and it is available to this facility class

# All other vehicles cost $100 to register
# A vehicle’s plate_type should be set to :regular, :antique, or :ev 
# upon successful registration