require 'spec_helper'


RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create vehicles' do
    it 'creates vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      expect(factory.create_vehicles(wa_ev_registrations))
    end
  end

end