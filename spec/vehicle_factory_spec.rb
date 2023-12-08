require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
    end

    describe "#Initialize" do
        it "exists"do
            expect(@factory).to be_an_instance_of (VehicleFactory)
        end

        it "starts with no vehicles" do
            expect(@factory.vehicles).to eq ([])
        end
    end
    describe "#Creates a vehicles collection" do
        it "stores the attributes correctly" do
            
        end
    end

end