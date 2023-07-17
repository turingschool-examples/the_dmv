require './lib/vehicle_factory'

describe VehicleFactory do
    it "exsits" do
        factory = VehicleFactory.new

        expect(factory).to be_an_instance_of(VehicleFactory)
    end
end

