require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  
  describe "Iteration 2" do
    it 'exists' do
      expect(@factory).to be_a(VehicleFactory)

    end
    it 'can create new vehicles from an API Call' do
      wa_ev = @factory.create_vehicles(@wa_ev_registrations)
      expect(wa_ev).to be_a(Array)
      expect(wa_ev.first).to be_a(Vehicle)
      expect(wa_ev.first.make).to eq("TESLA")
      expect(wa_ev.first.engine).to eq(:ev)
      expect(wa_ev.first.model).to eq("Model Y")
      expect(wa_ev.first.vin).to eq("7SAYGDEF6N")
      expect(wa_ev.first.year).to eq(2022)
    end

    it 'has key value updater method to add new key value pairs from keys in hash' do
      unformatted_hash = @wa_ev_registrations.first
      expect(unformatted_hash[:vin]).to be_nil
      expect(unformatted_hash[:year]).to be_nil
      expect(unformatted_hash[:engine]).to be_nil

      car_array = @factory.vehicle_key_updater(unformatted_hash)

      expect(car_array.first[:vin]).to eq("7SAYGDEF6N")
      expect(car_array.first[:year]).to eq(2022)
      expect(car_array.first[:engine]).to eq(:ev)
    end
  end
end