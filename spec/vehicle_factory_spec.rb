require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe 'create_vehicles' do
    it 'can fetch api data' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(wa_ev_registrations).to_not eq(nil)
    end

    it 'create_vehicle works from wa_ev_registrations' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      vehicles = @factory.create_vehicles(wa_ev_registrations)

      expect(vehicles).to_not eq(nil)
      expect(vehicles).to be_an(Array)
      expect(vehicles).to all(be_a(Vehicle))
    end
  end
end
