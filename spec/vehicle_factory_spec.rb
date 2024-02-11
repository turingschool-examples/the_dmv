require 'spec_helper'

RSpec.describe VehicleFactory do
  let (:factory) { VehicleFactory.new }
  let (:wa_ev_registrations) { DmvDataService.new.wa_ev_registrations }
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
    it 'can parse registration data from JSON to create vehicles and change their engine to ev if it is nil' do
      factory.create_vehicles(wa_ev_registrations)

      expect(factory.vehicles[0].engine).to eq(:ev)

      expect(factory.vehicles[0]).to be_an_instance_of(Vehicle)
    end
  end

  describe '#count_vehicle_makes' do
    it ' can count how many of each make there is' do
      factory.create_vehicles(wa_ev_registrations)

      make_counts = factory.count_vehicle_makes

      expect(make_counts[:TESLA]).to be_an_instance_of(Integer)
    end
  end
end