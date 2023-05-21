require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#generate_vehicles' do
    it 'can fetch wa_ev_registration data' do
      expect(@wa_ev_registrations.size).to eq(1000)
      expect(@wa_ev_registrations[0][:"electric_vehicle_type"]).to eq("Battery Electric Vehicle (BEV)")
      
    end
    
    it 'can create vehicles from data' do
      production_1 = @factory.create_vehicles(@wa_ev_registrations)
      expect(production_1.size).to eq(1000)
    end



  end




end