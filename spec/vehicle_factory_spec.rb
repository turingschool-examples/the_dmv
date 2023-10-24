require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service.rb"

describe VehicleFactory do

    it "exists" do
        factory = VehicleFactory.new

        expect(factory).to be_a VehicleFactory
    end

end