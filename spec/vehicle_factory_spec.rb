require 'spec_helper'

RSpec.describe VehicleFactory do
  let (:factory) { VehicleFactory.new }
  let (:wa_ev_registrations) { DmvDataService.new.wa_ev_registrations }
  let (:ny_registrations) { DmvDataService.new.ny_registrations }
  it 'exists' do
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  describe 'storing vehicles' do
    it 'has no vehicles by default' do
      expect(factory.vehicles).to be_empty
    end

    it 'can have vehicles' do
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.vehicles).not_to be_empty
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles from wa_ev_registrations and correctly match the key values' do
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.vehicles[0]).to be_an_instance_of(Vehicle)
      expect(factory.vehicles[0].vin).not_to be(nil)
      expect(factory.vehicles[0].year).not_to be(nil)
      expect(factory.vehicles[0].make).not_to be(nil)
      expect(factory.vehicles[0].model).not_to be(nil)
      expect(factory.vehicles[0].engine).to eq(:ev)
      expect(factory.vehicles[0].county).not_to be(nil)
    end

    it 'can create vehicles from ny_registrations and correctly match the key values' do
      factory.create_vehicles(ny_registrations)

      expect(factory.vehicles[0]).to be_an_instance_of(Vehicle)
      expect(factory.vehicles[0].vin).not_to be(nil)
      expect(factory.vehicles[0].year).not_to be(nil)
      expect(factory.vehicles[0].make).not_to be(nil)
      expect(factory.vehicles[0].model).not_to be(nil)
      expect(factory.vehicles[0].engine).not_to be(nil)
      expect(factory.vehicles[0].county).not_to be(nil)
    end
  end

  describe '#count_vehicle_makes' do
    it ' can count how many of each make there is' do
      factory.create_vehicles(wa_ev_registrations)

      make_counts = factory.count_vehicle_makes

      expect(make_counts[:TESLA]).to be_an_instance_of(Integer)
    end
  end

  describe '#count_vehicle_models' do
    it ' can count how many of each model there is' do
      factory.create_vehicles(wa_ev_registrations)

      model_counts = factory.count_vehicle_models

      expect(model_counts[:TESLA]).to be_an_instance_of(Integer)
    end
  end

  describe '#most_popular_make' do
    it 'can return the most popular make and its count' do
      factory.create_vehicles(wa_ev_registrations)

      most_popular_string = factory.most_popular_make

      expect(most_popular_string).to be_an_instance_of(String)
    end
  end

  describe '#count_model_by_year' do
    it 'can count the number of models for each year' do
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.count_model_by_year("model s", 2015)).to be_an_instance_of(Integer)
    end
  end

  describe '#count_vehicle_counties' do
    it 'can count the number of vehicles per county' do
      factory.create_vehicles(wa_ev_registrations)

      county_counts = factory.count_vehicle_counties

      expect(county_counts['King']).to be_an_instance_of(Integer)
    end
  end

  describe '#most_popular_county' do
    it 'can return the most popular county and its count' do

      factory.create_vehicles(wa_ev_registrations)

      most_popular_string = factory.most_popular_county

      expect(most_popular_string).to be_an_instance_of(String)
    end
  end
end