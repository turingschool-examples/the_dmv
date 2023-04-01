require 'spec_helper'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it "exists" do 
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do 
    it 'can create Vehicle objects using dmv data' do 
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Array) 
      expect(@factory.vehicles.length).to be(>5)
    end

    it 'assigns attributes to vehicle class instances' do 
      expect(@factory.vehicles(0).vin).not_to be nil
      expect(@factory.vehicles(0).year).not_to be nil
      expect(@factory.vehicles(0).make).not_to be nil
      expect(@factory.vehicles(0).model).not_to be nil
      expect(@factory.vehicles(0).registration_date).to be nil
      expect(@factory.vehicles(0).plate_type).to be nil
    end

    it 'assigns an :ev engine type' do 
      expect(@factory.vehicles(0).engine).to eq(:ev)
    end
  end
end