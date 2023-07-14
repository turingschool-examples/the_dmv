require 'spec_helper'
require './lib/dmv_data_service'
require './lib/vehicle'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)

      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
    end
  end
end