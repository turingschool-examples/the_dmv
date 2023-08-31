require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'should exist' do
      expect(@factory).to be_a VehicleFactory
    end
  end

  describe '#create_vehicles' do
    it 'should parse json data and create Vehicle objects' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles.length).to eq 1000
      expect(vehicles[0]).to be_a Vehicle
    end
  end
end
