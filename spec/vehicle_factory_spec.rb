require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'creates Vehicle objects with given attributes' do
     
      @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory_vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory_vehicles.length).to eq(@wa_ev_registrations.length)
      expect(@factory_vehicles.first).to be_a(Vehicle)
      
    end
  end
end