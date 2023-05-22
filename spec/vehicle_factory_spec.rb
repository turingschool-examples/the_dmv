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
      expect(@wa_ev_registrations).to be_an(Array)
      expect(@wa_ev_registrations.size).to eq(1000)
      expect(@wa_ev_registrations[0][:"electric_vehicle_type"]).to eq("Battery Electric Vehicle (BEV)")
    end
    
    it 'can create vehicles from data' do
      production_1 = @factory.create_vehicles(@wa_ev_registrations)
      expect(production_1.size).to eq(1000)
      expect(production_1.first.vin).to eq("7SAYGDEF6N")
      expect(production_1.first.year).to eq("2022")
      expect(production_1.first.make).to eq("TESLA")
      expect(production_1.first.model).to eq("Model Y")
      expect(production_1.first.engine).to eq(:ev)
      expect(production_1.first.registration_date).to eq(nil)
      expect(production_1.first.plate_type).to eq(nil)
    end

    it 'can count vehicles by make or model' do
      make_inventory = @factory.vehicles_by_make(@wa_ev_registrations)
      expect(make_inventory["TESLA"]).to eq(408)
      expect(make_inventory["TOYOTA"]).to eq(23)
      expect(make_inventory["PORSCHE"]).to eq(3)
    end
  end

end