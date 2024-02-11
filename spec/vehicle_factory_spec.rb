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

  describe '#create_vehicles' do
    it 'can create vehicles' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_an_instance_of(Array)
      expect(vehicles.first).to be_an_instance_of(Vehicle)
      expect(vehicles.first.engine.class).to be(Symbol)
      expect(vehicles.first.make.class).to be(String)
      expect(vehicles.first.engine).to eq :ev
      binding.pry
    end
  end
end