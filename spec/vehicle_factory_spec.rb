require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'creates vehicle objects' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    wa_vehicles = factory.create_vehicles(wa_ev_registrations)
    expect(wa_vehicles).to be_an_instance_of(Array)
    wa_vehicles.each do |vehicle|
      expect(vehicle).to be_an_instance_of(Vehicle)
    end
  end
end