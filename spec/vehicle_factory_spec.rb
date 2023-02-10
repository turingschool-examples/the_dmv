require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#Iteration 2: Reading from External Data Sets' do
    it 'can create vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      
      expect(@factory.create_vehicles(wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end
  end
end