require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "can initialize" do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  # write tests that test the whole of the array for vins, then a test for all of the vehicles, etc.
  # expect(....).to all be_a(vehicle)

  describe "#create_vehicles" do
    it "can create vehicles" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      array_of_vehicles = factory.create_vehicles(wa_ev_registrations)
      vehicle_1 = array_of_vehicles.sample
      
      expect(array_of_vehicles).to all be_a(Vehicle)
      expect(vehicle_1.vin).to be_a(String)
      expect(vehicle_1.year).to be_a(Integer)
      expect(vehicle_1.make).to be_a(String)
      expect(vehicle_1.model).to be_a(String)
      expect(vehicle_1.engine).to eq(:ev)
      expect(array_of_vehicles.length).to eq(wa_ev_registrations.length)
    end
  end

end