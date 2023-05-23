require 'spec_helper'


RSpec.describe VehicleFactory do
  before do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  it 'exists' do
    expect(@factory).to be_a(VehicleFactory)
  end
  
  describe '#create vehicle' do
    it 'generates new vehicle instances' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_a(Array)
      expect(vehicles.length).to eq(1000)
      expect(vehicles.sample).to be_a(Vehicle)
      expect(vehicles.first.make).to eq("TESLA")
      expect(vehicles.first.engine).to eq(:ev)
      expect(vehicles.first.model).to eq("Model Y")
      expect(vehicles.first.vin).to eq("7SAYGDEF6N")
      expect(vehicles.first.year).to eq(2022)
      expect(vehicles.sample.engine).to eq(:ev)
      expect(vehicles.sample.vin).to be_a(String)
    end

    it 'can work on one vehicle' do
      vehicle = @factory.create_vehicles(@wa_ev_registrations.first)
      expect(vehicle).to be_a(Vehicle)
    end
  end
end