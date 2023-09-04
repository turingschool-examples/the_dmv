require 'spec_helper'

describe '#DMV data services' do
    it 'creates vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    
      expect(factory.create_vehicles(wa_ev_registrations)[0]).to be_instance_of Vehicle
      factory.create_vehicles(wa_ev_registrations).each do |data|
      expect(data).to be_instance_of Vehicle
      end
    end
  end