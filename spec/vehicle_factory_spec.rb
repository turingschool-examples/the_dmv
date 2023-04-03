require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do

    @factory = VehicleFactory.new 
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
    
  describe "Vehicle Factory" do
    
    it "exists" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  
  describe "create_vehicles method" do 

    it "can create a new vehicle with make information from database" do

      expect(@factory.create_vehicles(@wa_ev_registrations)[0].make).to eq("SMART")
    end

    it "can create a new vehicle with model information from database" do

      expect(@factory.create_vehicles(@wa_ev_registrations)[0].model).to eq("Fortwo Electric Drive")
    end

    it "can create a new vehicle with vin information from database" do

      expect(@factory.create_vehicles(@wa_ev_registrations)[0].vin).to eq("WMEEJ9AA7E")
    end

    it "can create a new vehicle with model_year information from database" do

      expect(@factory.create_vehicles(@wa_ev_registrations)[0].year).to eq("2014")
    end

    it "can make an array of new vehicles" do

      expect(@factory.create_vehicles(@wa_ev_registrations).first).to be_a(Vehicle)
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an(Array)

    end
   
  end

end