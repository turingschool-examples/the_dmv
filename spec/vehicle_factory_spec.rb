require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

describe VehicleFactory do 
  factory = VehicleFactory.new
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
  describe "#create_vehicles" do
    it "brings data in as an Array" do
      
      expect(factory.create_vehicles(wa_ev_registrations)).to be_an Array
    end

    it "The array is full of only Vehicle Objects" do
      expect(factory.create_vehicles(wa_ev_registrations)).to all be_a Vehicle
    end

    it "Isn't an empty data set" do
      expect(factory.create_vehicles(wa_ev_registrations).length).to be_a Integer
    end

    it "can make vehicles from Ny data source" do
      expect(factory.create_vehicles(ny_vehicle_registrations)).to be_an Array
      expect(factory.create_vehicles(ny_vehicle_registrations)).to all be_a Vehicle
    end
  end
end