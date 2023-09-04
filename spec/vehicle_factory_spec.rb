require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    DmvDataService.new.wa_ev_registrations

  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'creates Vehicle objects with attributes' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicle_data = { vin_1_10: ['JTDKN3DP8D'], make: ['TOYOTA'], 
        model: ['Prius Plug-in'], model_year: ['2013'], engine: ['ev'] }
      factory_vehicles = @factory.create_vehicles(wa_ev_registrations)
      expect(factory_vehicles.length).to eq(wa_ev_registrations.length)
     
    end
  end
end