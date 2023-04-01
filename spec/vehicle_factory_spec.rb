require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "Iteration 2: Reading external data sets" do
    it "exists" do
      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory)
    end

    it "create vehicles using wa dmv data set" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      
      new_cars = factory.create_vehicles(wa_ev_registrations)

      expect(new_cars[0].engine).to eq(:ev)
      expect(new_cars[0].make).to eq("SMART")
      expect(new_cars[0].model).to eq("Fortwo Electric Drive")
      expect(new_cars[0].vin).to eq("WMEEJ9AA7E")
      expect(new_cars[0].year).to eq("2014")
      expect(new_cars[0].plate_type).to eq(nil)
      expect(new_cars[0].registration_date).to eq(nil)
      expect(new_cars[2].make).to eq("VOLKSWAGEN")
      expect(new_cars[3].model).to eq("e-Golf")
      expect(new_cars[4].vin).to eq("WVWKR7AU7K")
      expect(new_cars[6].year).to eq("2019")
    end
  end
end