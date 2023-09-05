require 'spec_helper'

RSpec.describe "VehicleFactory" do
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations 

  end

  describe "#create_vehicle" do 
    it "creates vehicles with attributes" do 
      expect(@factory).to be_an_instance_of(VehicleFactory)
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations 
      @factory.create_vehicles(@wa_ev_registrations)
    
    
      #Substitute @wa_ev_registrations for details
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations 

      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an Array
      expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a Vehicle
      expect(@factory.create_vehicles(@wa_ev_registrations).first.engine).to eq(:ev)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.model).to eq("Leaf")
      expect(@factory.create_vehicles(@wa_ev_registrations).first.plate_type).to eq(nil)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.registration_date).to eq(nil)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.vin).to eq("1N4AZ0CPXF")
      expect(@factory.create_vehicles(@wa_ev_registrations).first.year).to eq("2015")
    end
  end
end
