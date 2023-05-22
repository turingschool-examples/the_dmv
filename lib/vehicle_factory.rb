require './lib/vehicle'
require './lib/dmv_data_service'

class VehicleFactory
  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      Vehicle.new({
        vin: vehicle[:vin_1_10]
        year: vehicle[:model_year]
        make: vehicle[:make]
        model: vehicle[:model]
        engine: :ev
      })
    end
  end
end


#@cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )