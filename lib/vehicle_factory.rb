class VehicleFactory
  def initialize
    
  end

  # def create_vehicles(vehicles)
  #   arr = vehicles.each do |vehicle|
  #     vehicle[:year] = vehicle.delete(:model_year)  
  #     vehicle[:vin] = vehicle.delete(:vin_1_10)  
  #   end
  #   vehicles.replace(arr)
  #   arr1 = []
  #   manufactured = vehicles.each do |created|
  #     created = Vehicle.new(vehicles)
  #     created.engine = :ev
  #     arr1 << created
  #   end
  #   return arr1
  # end

  def create_vehicles(registrations)
    created_vehicles = registrations.map do |car|
      Vehicle.new(
        { 
          vin:    car[:vin_1_10],
          year:   car[:model_year],
          make:   car[:make],
          model:  car[:model],
          engine: :ev
        }
      )
    end
    created_vehicles
    ## Second Iteration, but was modifying the original arrray with delete
    # created_vehicles = registrations.map do |registration|
    #   registration[:year] = registration.delete(:model_year)  
    #   registration[:vin] = registration.delete(:vin_1_10)
    #   registration[:engine] = :ev
    #   Vehicle.new(registration)
    # end
    # created_vehicles
    ## Earlier Iteration
    # registrations.map do |registration|
    #   registration[:year] = registration.delete(:model_year)  
    #   registration[:vin] = registration.delete(:vin_1_10)
    #   registration[:engine] = :ev
    # end
    # vehicles = []
    # registrations.each do |registration|
    #   car = Vehicle.new(registration)
    #   vehicles << car
    # end
    # return vehicles
  end
end