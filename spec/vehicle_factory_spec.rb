require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'spec_helper'

RSpec.describe VehicleFactory do 


  it 'exists' do 
    @factory = VehicleFactory.new 
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(@factory).to be_a(VehicleFactory)
  end

  it 'can create vehicles' do 
    @factory = VehicleFactory.new 
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    expect(@factory.vehicles).to eq([])
    @factory.create_vehicles(@wa_ev_registrations)
    expect(@factory.vehicles.first).to be_a(Vehicle)
    expect(@factory.vehicles.first.vin).to be_truthy 
    expect(@factory.vehicles.first.year).to be_truthy 
    expect(@factory.vehicles.first.make).to be_truthy 
    expect(@factory.vehicles.first.model).to be_truthy 
  end

  it "can create many vehicles" do
    @factory = VehicleFactory.new 
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
    @factory.create_vehicles(@wa_ev_registrations)
    expect(@factory.vehicles.last).to be_an_instance_of(Vehicle)
    expect(@factory.vehicles.last.vin).to be_truthy 
    expect(@factory.vehicles.last.year).to be_truthy 
    expect(@factory.vehicles.last.make).to be_truthy 
    expect(@factory.vehicles.last.model).to be_truthy 
  end
end 