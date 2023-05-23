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
      expect(@factory.created_vehicles.length).to eq wa_ev_registrations.length
    end

    it 'works with new york data also' do
      ny_registrations = DmvDataService.new.ny_registrations
      expect(@factory.created_vehicles).to eq []
      @factory.create_vehicles(ny_registrations)
      expect(@factory.created_vehicles).to include(Vehicle)
      expect(@factory.created_vehicles.length).to eq ny_registrations.length
    end
  end

  describe '#find_most_popular' do
    it 'can find most popular make and model from an array of created vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.most_popular_make_model).to eq "NISSAN Leaf"
    end
  end

  describe '#count methods' do
    it 'can count the number of vehicles that are the same model registered in a given year' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.models_in_a_year("Leaf", "2015")).to eq 48
      expect(@factory.models_in_a_year("Focus", "2016")).to eq 4
    end

    it 'can count the number of vehicles that are registered in a given year' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.vehicles_in_a_year("2015")).to eq 93
      expect(@factory.vehicles_in_a_year("2016")).to eq 95
    end
  end

  describe '#most_popular_county method' do
    it 'returns name of county with most registered vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      expect(@factory.most_popular_county).to eq "King"
    end
  end
end