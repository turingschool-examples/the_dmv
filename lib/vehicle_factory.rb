class VehicleFactory

  attr_reader :vehicles_list
    def initialize
      @vehicles_list = []
    end

    def create_vehicles(vehicles)
      vehicles.each do |vehicle|
        @vehicles_list << Vehicle.new(vehicle)
      end
    end

end

#Could pull data but unable to make similar to FacilityFactory. Would fix if had more time
# def create_vehicles(vehicles)
#   vehicles.each do |vehicle|
#     @vehicles_list << Vehicle.new({vin: vehicle[:vin_1_10], 
#     year: vehicle[:model_year], 
#     make: vehicle[:make], 
#     model: vehicle[:model]
#     plate_type: vehicle[:state_of_residence],
#     registration_date: vehicle [:transaction_year]})
#   end
# end