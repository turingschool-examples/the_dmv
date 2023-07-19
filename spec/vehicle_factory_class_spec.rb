require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  
	describe '#initialize' do
   it 'can initialize' do

    expect(@factory).to be_an_instance_of(VehicleFactory)
    expect(@wa_ev_registrations).to be_an_instance_of(Array)
            
   end
  end
    
	describe '#create vehicles' do
    it "can add vehicles from state's DMV office"do
    vehicles = @factory.create_vehicles(@wa_ev_registrations)
        
    expect(vehicles[0]).to be_a(Vehicle)
    expect(vehicles).to be_an_instance_of(Array)
    expect(vehicles[0].vin).to_not eq(nil)
    expect(vehicles[0].vin).to be_an_instance_of(String)
    expect(vehicles[0].year).to_not eq(nil)
    expect(vehicles[0].year).to be_a(Integer)
    expect(vehicles[0].make).to_not eq(nil)
    expect(vehicles[0].make).to be_a(String)
    expect(vehicles[0].model).to_not eq(nil)
    expect(vehicles[0].model).to be_a(String)
    expect(vehicles[0].engine).to eq(:ev)
    expect(vehicles.length).to eq(@wa_ev_registrations.length)
    end
  end
end