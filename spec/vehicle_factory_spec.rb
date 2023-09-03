require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
   @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  
  describe '#initialize' do
    it 'initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  
  describe '#create_vehicle' do
    it 'creates vehicles up to 1000' do
      expect(@factory.create_vehicle(@wa_ev_registrations).length).to eq(1000)
    end
  end
end