require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe "#initialize" do
    it 'initializes' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end
  
  describe '#create_vehicles' do
    it 'creates vehicles with the assigned attributes' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.vehicles).to be_a Array 
    end
  end
end