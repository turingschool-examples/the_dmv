require 'spec_helper'

RSpec.describe VehicleFactory do
  wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  ny_registrations = DmvDataService.new.ny_registrations
  factory = VehicleFactory.new
  wa_ev_vehicles = factory.create_vehicles(wa_ev_registrations)
  ny_vehicles = factory.create_vehicles(ny_registrations)

  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'returns an array' do
      expect(wa_ev_vehicles).to be_a(Array)
      expect(ny_vehicles).to be_a(Array)
    end

    it 'returns an array of Vehicle objects' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.is_a?(Vehicle) })
        .to be(true)
    end

    it 'assigns the @vin attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.vin.is_a?(String) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.vin.is_a?(String) })
        .to be(true)
    end

    it 'assigns the @year attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.year.is_a?(String) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.year.is_a?(String) })
        .to be(true)
    end

    it 'assigns the @make attribute on every vehicle to a string value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.make.is_a?(String) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.make.is_a?(String) })
        .to be(true)
    end

    it 'assigns the @model attribute on every vehicle to a string value or nil' do
      expect(wa_ev_vehicles.all? do |vehicle|
        vehicle.model.is_a?(String) || vehicle.model == nil
      end).to be(true)
      expect(ny_vehicles.all? do |vehicle|
        vehicle.model.is_a?(String) || vehicle.model == nil
      end).to be(true)
    end

    it 'assigns the @engine attribute on every vehicle to a symbol value' do
      expect(wa_ev_vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) })
        .to be(true)
      expect(ny_vehicles.all? { |vehicle| vehicle.engine.is_a?(Symbol) })
        .to be(true)
    end

    it 'assigns the correct attributes and values to WA vehicles' do
      expect(wa_ev_vehicles.first.vin).to eq(WA_EV_VEHICLE[:vin])
      expect(wa_ev_vehicles.first.year).to eq(WA_EV_VEHICLE[:year])
      expect(wa_ev_vehicles.first.make).to eq(WA_EV_VEHICLE[:make])
      expect(wa_ev_vehicles.first.model).to eq(WA_EV_VEHICLE[:model])
      expect(wa_ev_vehicles.first.engine).to eq(WA_EV_VEHICLE[:engine])
      expect(wa_ev_vehicles.first.registration_date).to be(nil)
    end

    it 'assigns the correct attributes and values to NY vehicles' do
      expect(ny_vehicles.first.vin).to eq(NY_VEHICLE[:vin])
      expect(ny_vehicles.first.year).to eq(NY_VEHICLE[:year])
      expect(ny_vehicles.first.make).to eq(NY_VEHICLE[:make])
      expect(ny_vehicles.first.model).to eq(NY_VEHICLE[:model])
      expect(ny_vehicles.first.engine).to eq(NY_VEHICLE[:engine])
      expect(ny_vehicles.first.registration_date).to be(nil)
    end

    it 'returns nil for invalid state data' do
      expect(factory.create_vehicles([])).to be(nil)
    end
  end

  describe '#get_us_state' do
    it 'returns the :WA symbol for Washington state vehicle data' do
      expect(factory.get_us_state(wa_ev_registrations)).to be(:WA)
    end

    it 'returns the :NY symbol for New York state vehicle data' do
      expect(factory.get_us_state(ny_registrations)).to be(:NY)
    end

    it 'returns nil for any other invalid vehicle data' do
      expect(factory.get_us_state([])).to be(nil)
    end
  end

  describe '#make_model_counts' do
    actual = factory.make_model_counts(wa_ev_vehicles)

    it 'returns a hash' do
      expect(actual).to be_a(Hash)
    end

    it 'it has keys that are hashes' do
      expect(actual.all? { |key, _| key.is_a?(Hash) }).to be(true)
    end

    it 'it has values that are integers representing the counts of each key' do
      expect(actual.all? { |_, value| value.is_a?(Integer) }).to be(true)
    end
  end

  describe '#most_popular_make_model' do
    actual = factory.most_popular_make_model(wa_ev_vehicles)
    expected = {
      make: 'NISSAN',
      model: 'Leaf'
    }

    it 'returns a hash' do
      expect(actual).to be_a(Hash)
    end

    it 'the returned hash has a make symbol key' do
      expect(actual.key?(:make)).to be(true)
    end

    it 'the returned hash has a model symbol key' do
      expect(actual.key?(:model)).to be(true)
    end

    it 'the values of the returned hash are all strings' do
      expect(actual.values.all? { |value| value.is_a?(String) }).to be(true)
    end

    it 'returns the most popular make/model registered for WA ev data' do
      expect(actual).to eq(expected)
    end
  end

  describe '#create_wa_ev_vehicles' do

  end

  describe '#create_ny_vehicles' do

  end
end
