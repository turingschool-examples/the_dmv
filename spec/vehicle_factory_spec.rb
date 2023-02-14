require 'spec_helper'

RSpec.describe VehicleFactory do
  let(:factory) {VehicleFactory.new}
  let(:wa_ev_registrations) {DmvDataService.new.wa_ev_registrations}

  it 'exists' do
    expect(factory).to be_a(VehicleFactory)
  end

  describe '#create vehicles' do
    it 'the factory can create vehicles' do
      factory.create_vehicles(wa_ev_registrations).each do |vehicle|
        expect(vehicle).to be_a Vehicle
      end
    end
  end





end