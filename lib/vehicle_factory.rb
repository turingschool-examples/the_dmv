class VehicleFactory
  attr_reader :database, 
              :new_vehicles, 
              :city

  def initialize
    # @city = city
    @database = DmvDataService.new.wa_ev_registrations
    @new_vehicles = []
  end
  
  def create_vehicles
    vehicle_details = {
      vin: nil, 
      year: nil , 
      make: nil, 
      model: nil, 
      engine: :ev
    }
    new_car = Vehicle.new(vehicle_details)
    vehicle_details[:make] = @database[0][:make]
    vehicle_details[:vin] = @database[0][:vin_1_10]
    require 'pry'; binding.pry
    @new_vehicles << new_car
    # require 'pry'; binding.pry
    # new_car.engine
    # require 'pry'; binding.pry
  end
  
 
  # I need to call on the database key/value pairs 
  # to build vehicles from that information. 
  # I need to instantiate an empty array? 
  
  
  #could initialize it with the city as a parameter
  # and then have the database be assgined to a method
  # and the method could include? the city name and match 
  # the database to that?
end