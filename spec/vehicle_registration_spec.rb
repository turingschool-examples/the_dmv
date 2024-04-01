require './lib/facility'
require './lib/vehicle'
require "./lib/vehicle_registration"

RSpec.describe VehicleRegistration do

it "exists" do
    cruze = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

    expect(cruze).to be_instance_of(Vehicle)
    expect(bolt).to be_instance_of(Vehicle)
    expect(camaro).to be_instance_of(Vehicle)
end

it ""
end