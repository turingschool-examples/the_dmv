require 'spec_helper'

RSpec.describe VehicleFactory do
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  factory = VehicleFactory.new
  vehicles = factory.create_vehicles(wa_ev_registrations)

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'returns an array' do
      expect(vehicles).to be_a(Array)
    end

    it 'returns an array of Vehicle objects' do
      expect(vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) }).to be(true)
    end

    it 'has a :vin key with a string value on every vehicle' do
      expect(vehicles.all? { |vehicle| vehicle.vin.is_a?(String) }).to be(true)
    end

    it 'has a :year key with a string value on every vehicle' do
      expect(vehicles.all? { |vehicle| vehicle.year.is_a?(String) }).to be(true)
    end

    it 'has a :make key with a string value on every vehicle' do
      expect(vehicles.all? { |vehicle| vehicle.make.is_a?(String) }).to be(true)
    end

    it 'has a :model key with a string value on every vehicle' do
      expect(vehicles.all? { |vehicle| vehicle.model.is_a?(String) }).to be(true)
    end

    it 'has a :engine key with a symbol value on every vehicle' do
      expect(vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) }).to be(true)
    end
  end
end
