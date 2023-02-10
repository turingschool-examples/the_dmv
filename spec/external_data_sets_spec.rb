require 'spec_helper'

RSpec.describe 'Vehicle Factory' do
  describe 'exists' do
    it '#is an instance of' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe 'accesses the API' do
    it 'can create vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(factory.create_vehicles(wa_ev_registrations)).to eq(factory.created_vehicles)
    end
  end
end