require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can add a list of vehicles from a database to created vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(@factory.created_vehicles).to eq []
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.created_vehicles).to include(Vehicle)
    end
  end

  describe '#find_most_popular' do
    it 'can find most popular make and model from an array of created vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.find_most_popular).to eq "NISSAN Leaf"
    end
  end
end