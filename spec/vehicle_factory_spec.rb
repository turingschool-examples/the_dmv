require 'spec_helper'
require './lib/vehicle_factory.rb'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#create_WA_EV_vehicles' do
    it 'will create Vehicle objects using a registration dataset' do
      @factory.create_vehicles(@wa_ev_registrations).each do |registration|
        expect(registration).to be_an_instance_of(Vehicle)
        expect(registration.engine).to eq(:ev)
      end
    end
  end
end
