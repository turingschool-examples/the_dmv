require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#create_vehicles' do
    it 'will create Vehicle objects using a registration dataset' do
      @factory.create_vehicles(@wa_ev_registrations).each do |registration|
        expect(registration).to be_an_instance_of(Vehicle)
      end
      
      expect(@factory.create_vehicles(@wa_ev_registrations)[0].engine).to eq(:ev) 
    end
  end
end