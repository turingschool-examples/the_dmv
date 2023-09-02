require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#VehicleFactory' do
    it 'can initialize and object' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create vehicles' do
    it 'can create a vehicle from provided data' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(factory.create_vehicles(wa_ev_registrations)).to_not be nil
      #did not know how to write what to expect for the output.
    end
  end
end 