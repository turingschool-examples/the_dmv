require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#create_vehicles' do
    it 'will create Vehicle objects using a registration dataset' do
      expect(@factory.create_vehicles(wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end
  end
end