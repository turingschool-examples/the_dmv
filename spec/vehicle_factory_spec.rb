require 'spec_helper'

RSpec.describe WaVehicleFactory do 
  before(:each) do 
    @factory = WaVehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it "exists" do 
      expect(@factory).to be_a(WaVehicleFactory)
    end

    it 'has a vehicles attribute that is empty be default' do 
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#create_vehicles' do 
    it 'can create Vehicle objects using dmv data' do 
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Array) 
      expect(@factory.vehicles.length).not_to eq(0)

    end

    it 'assigns attributes to vehicle class instances' do 
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.vehicles[0]).to be_a(Vehicle)
      expect(@factory.vehicles[0].vin).not_to be nil
      expect(@factory.vehicles[0].year).not_to be nil
      expect(@factory.vehicles[0].make).not_to be nil
      expect(@factory.vehicles[0].model).not_to be nil
      expect(@factory.vehicles[0].registration_date).to be nil
      expect(@factory.vehicles[0].plate_type).to be nil
    end

    it 'assigns an :ev engine type' do 
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.vehicles[0].engine).to eq(:ev)
    end
  end
end