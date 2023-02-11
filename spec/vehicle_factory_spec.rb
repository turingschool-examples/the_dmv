require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'creates vehicles from given source' do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
      expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end
  end

end