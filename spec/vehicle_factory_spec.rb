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
      expect(factory.vehicle_list.first).to be_an_instance_of(Vehicle) 
      expect(factory.vehicle_list.last).to be_an_instance_of(Vehicle)
      expect(factory.vehicle_list.length).to eq(1000)
    end
  end
end