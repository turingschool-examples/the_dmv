require './lib/vehicle/'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe "washington vehicles" do
    before(:each) do
      @factory = VehicleFactory.new
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(@wa_ev_registrations)
    end
    
    xit "is an array" do
      expect(@wa_ev_registrations).to be_a(Array)
    end

    xit "is an array of hashes" do
      for i in 0..@wa_ev_registrations.count - 1
        expect(@wa_ev_registrations[i]).to be_a(Hash)
      end
    end

    xit "can use extracted hash to instantiate new vehicle into array with attributes" do
      expect(@factory.state_vehicles[0].vin).to eq("JTDKN3DP8D")
    end

    xit "pulls in all specified information from remote data" do
      expect(@factory.state_vehicles[0].vin).to eq("JTDKN3DP8D")
      expect(@factory.state_vehicles[0].year).to eq(2013)
      expect(@factory.state_vehicles[0].make).to eq("TOYOTA")
      expect(@factory.state_vehicles[0].model).to eq("Prius Plug-in")
      expect(@factory.state_vehicles[0].engine).to eq(:ev)
    end

    xit "builds correct number of vehicles" do
      expect(@factory.state_vehicles.count).to eq(1000)
    end

    it "registers as electric vehicle" do
      # expect(@factory.state_vehicles[450].engine).to eq(:ev)
      expect(@factory.state_vehicles[900].engine).to eq(:ev)
      expect(@factory.state_vehicles[123].engine).to eq(:ev)
      expect(@factory.state_vehicles[555].engine).to eq(:ev)
      expect(@factory.state_vehicles[637].engine).to eq(:ev)
    end
  end

  describe "ny vehicles" do
    before(:each) do
      @factory = VehicleFactory.new
      @ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
      @factory.create_vehicles(@ny_vehicle_registrations)
    end

    it "pulls data from ny into an array" do
      expect(@ny_vehicle_registrations).to be_a(Array)
      expect(@ny_vehicle_registrations.length).to eq(1000)
    end

    it "filters out non-car-or-truck registrations" do
      expect(@factory.state_vehicles.count).to eq(234)
    end

    it "can instantiate vehicles" do
      expect(@factory.state_vehicles[0].vin).to eq("9999236")
    end

    it "vehicles have the correct keys and values" do
      expect(@factory.state_vehicles[0].vin).to eq("9999236")
      expect(@factory.state_vehicles[0].year).to eq("1937")
      expect(@factory.state_vehicles[0].make).to eq("CHRY")
      expect(@factory.state_vehicles[0].model).to eq("information unavailable")
      expect(@factory.state_vehicles[0].engine).to eq(:ice)
    end
  end
end