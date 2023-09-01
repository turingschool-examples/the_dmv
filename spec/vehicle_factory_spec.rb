require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    dds = DmvDataService.new
    @wa_ev_registrations = dds.wa_ev_registrations
    @ny_registrations = dds.ny_registrations
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

    it 'should parse NY data and filter out boats and trailers' do
      vehicles = @factory.create_vehicles(@ny_registrations)
      expect(vehicles.length).to eq 566
      expect(vehicles[0].engine).to eq :gas || :diesel || :flex
    end
  end
end
