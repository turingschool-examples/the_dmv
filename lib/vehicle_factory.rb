class VehicleFactory
  attr_reader :database, :new_vehicles

  def initialize
    @database = DmvDataService.new.wa_ev_registrations
    @new_vehicles = []
  end
end

def create_vehicles(database)
new_car = Vehicle.new 
require 'pry'; binding.pry
end

# I need to call on the database key/value pairs 
# to build vehicles from that information. 
# I need to instantiate an empty array? 

can i see any of this