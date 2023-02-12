require 'spec_helper'

RSpec.describe VehicleFactory do
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  factory = VehicleFactory.new
  wa_ev_vehicles = factory.create_vehicles(wa_ev_registrations)

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'returns an array' do
      expect(wa_ev_vehicles).to be_a(Array)
    end

    it 'returns an array of Vehicle objects' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) }).to be(true)
    end

    it 'assigns the @vin attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.vin.is_a?(String) }).to be(true)
    end

    it 'assigns the @year attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.year.is_a?(String) }).to be(true)
    end

    it 'assigns the @make attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.make.is_a?(String) }).to be(true)
    end

    it 'assigns the @model attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.model.is_a?(String) }).to be(true)
    end

    it 'assigns the @engine attribute on every vehicle to a symbol value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) }).to be(true)
    end

    it 'assigns the correct string value to the @vin attribute on every WA state electric vehicle' do
      expect(wa_ev_vehicles.first.vin).to eq('JTDKN3DP8D')
    end

    it 'assigns the correct string value to the @year attribute on every WA state electric vehicle' do
      expect(wa_ev_vehicles.first.year).to eq('2013')
    end

    it 'assigns the correct string value to the @make attribute on every WA state electric vehicle' do
      expect(wa_ev_vehicles.first.make).to eq('TOYOTA')
    end

    it 'assigns the correct string value to the @model attribute on every WA state electric vehicle' do
      expect(wa_ev_vehicles.first.model).to eq('Prius Plug-in')
    end

    it 'assigns the correct symbol value to the @engine attribute on every WA state electric vehicle' do
      expect(wa_ev_vehicles.first.engine).to eq(:ev)
    end
  end
end
