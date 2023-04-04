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
    expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
  end

  describe '#create_facilities' do
    it 'creates facilities from given source' do
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an_instance_of(Array)
      expect(@factory.create_vehicles(@wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end
  end
end