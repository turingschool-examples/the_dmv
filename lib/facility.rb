require 'date'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

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

def facilities_offering_service(service)
  @facilities.select do |facility|
    facility.services.include?(service)
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