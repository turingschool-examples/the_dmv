require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#wa_ev_registrations' do
    it 'shows pulled data from wa_ev_registrations' do
      expect(@wa_ev_registrations).to include()
    end
  end

  describe '#create WA vehicles' do
    it 'creates WA vehicles' do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to include()
    end
  end
end