require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  it 'exists' do
    expect(@factory).to be_an_instance_of VehicleFactory
  end

  it 'creates a list of vehicles using an API' do
    @factory.create_vehicles(@wa_ev_registrations)
  end
end