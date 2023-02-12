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

    it 'assigns the @vin attribute on every vehicle to a string value' do
      expect(vehicles.all? { |vehicle| vehicle.vin.is_a?(String) }).to be(true)
    end

    it 'assigns the @year attribute on every vehicle to a string value' do
      expect(vehicles.all? { |vehicle| vehicle.year.is_a?(String) }).to be(true)
    end

    it 'assigns the @make attribute on every vehicle to a string value' do
      expect(vehicles.all? { |vehicle| vehicle.make.is_a?(String) }).to be(true)
    end

    it 'assigns the @model attribute on every vehicle to a string value' do
      expect(vehicles.all? { |vehicle| vehicle.model.is_a?(String) }).to be(true)
    end

    it 'assigns the @engine attribute on every vehicle to a symbol value' do
      expect(vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) }).to be(true)
    end
  end
end
