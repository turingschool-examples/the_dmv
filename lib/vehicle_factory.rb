class VehicleFactory
  attr_reader :database, 
              :new_vehicles, 
              :city

  def initialize
    # @city = city
    # @database = DmvDataService.new.wa_ev_registrations
    @new_vehicles = []
  end
  
  def create_vehicles(database = nil)
    # require 'pry'; binding.pry
    vehicle_details = {
      vin: nil, 
      year: nil , 
      make: nil, 
      model: nil, 
      engine: :ev
    }
    empty_new_car = Vehicle.new(vehicle_details)
    return @new_vehicles << empty_new_car unless database.class == Array
    vehicle_details[:make] = database[0][:make]
    vehicle_details[:model] = database[0][:model]
    vehicle_details[:vin] = database[0][:vin_1_10]
    vehicle_details[:year] = database[0][:model_year]
    full_new_car = Vehicle.new(vehicle_details)
    @new_vehicles << full_new_car
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