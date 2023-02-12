require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'exists' do
    
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do    #my before(:each) decided to not work here and I couldn't figure out why
    it 'can create vehicles' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      wa = factory.create_vehicles(wa_ev_registrations)

      expect(wa.size).to eq(1000)
    end
  end
end
