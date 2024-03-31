require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    it "can initialize" do
      vehicle_factory = VehicleFactory.new

      expect(vehicle_factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe 'create_vehicles' do
    it "can create cars from registrations" do
      vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      #need more robust testing for actual vehicle data
      #maybe use vehicle example checking attr filtered correctly
      expect(vehicle_factory.create_vehicles(wa_ev_registrations)).to all(be_a(Vehicle))
    end
  end
end