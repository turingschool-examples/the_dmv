require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe 'initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
      # require 'pry'; binding.pry
    end
  end
  
  describe '#create_vehicles' do
    it 'returns a vehicle from the factory' do
        expect(@factory.create_vehicles(@wa_ev_registrations)).to be_a(Vehicle)
    end
  end
end