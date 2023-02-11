require 'spec_helper'

RSpec.describe VehicleFactory do
  it 'exists' do
    factory = VehicleFactory.new

    expect(factory).to be_instance_of(VehicleFactory)
  end

  it 'can create vehicles with retrieved data from an API' do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)
    require 'pry'; binding.pry

    expect(factory.vehicle_storage[0]).to be_instance_of(Vehicle)
    expect(factory.vehicle_storage.length).to eq(1000)
  end
end