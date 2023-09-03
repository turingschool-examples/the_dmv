require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it 'exists' do
      factory = VehicleFactory.new
      
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
    
    it 'can access WA EV registrations and create a vehicle' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
    end
    
    xit "can create vehicles" do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      factory.create_vehicles(wa_ev_registrations)
      require 'pry'; binding.pry
    end


  end
end
