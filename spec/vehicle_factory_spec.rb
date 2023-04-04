require "rspec"
require "spec_helper"
require "./lib/vehicle"
require "./lib/vehicle_factory"
require "./lib/dmv_data_service"

RSpec.describe VehicleFactory do
  context "Iteration 2" do
    it "exists" do
      factory = VehicleFactory.new
  
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
    
    it "can create vehicles" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      new_cars = factory.create_vehicles(wa_ev_registrations)
      
      expect(new_cars).to be_a(Array)
      expect(new_cars[0].make).to eq("SMART")
      expect(new_cars[0].engine).to eq(:ev)
      expect(new_cars[0].electric_vehicle?).to be true
      expect(new_cars[0].model).to eq("Fortwo Electric Drive")
      expect(new_cars[0].plate_type).to be nil
      expect(new_cars[0].registration_date).to be nil
      expect(new_cars[0].vin).to eq("WMEEJ9AA7E")
      expect(new_cars[0].year).to eq("2014")
      
      expect(new_cars[2].make).to eq("VOLKSWAGEN")
      expect(new_cars[2].engine).to eq(:ev)
      expect(new_cars[2].electric_vehicle?).to be true
      expect(new_cars[2].model).to eq("e-Golf")
      expect(new_cars[2].plate_type).to be nil
      expect(new_cars[2].registration_date).to be nil
      expect(new_cars[2].vin).to eq("WVWKR7AU7K")
      expect(new_cars[2].year).to eq("2019")
    end
  end
end