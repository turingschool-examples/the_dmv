require 'spec_helper'

RSpec.describe VehicleFactory do 
  before(:each) do 
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe '#initialize' do
    it "exists" do 
      expect(@factory).to be_a(VehicleFactory)
    end

    it 'has a vehicles attribute that is empty be default' do 
      expect(@factory.vehicles).to eq([])
    end
  end

  describe '#add_wa_ev_source' do
    it 'normalizes incoming vehicle data and adds engine key and value' do
      @factory.add_wa_ev_source(@wa_ev_registrations)
      first_car = @factory.vehicles[0]

      expect(first_car).to be_a(Hash)
      expect(first_car[:vin]).not_to be nil
      expect(first_car[:year]).not_to be nil
      expect(first_car[:make]).not_to be nil
      expect(first_car[:model]).not_to be nil
      expect(first_car[:engine]).to eq(:ev)
    end

    it 'adds normalized data to vehicles attribute' do
      @factory.add_wa_ev_source(@wa_ev_registrations)

      expect(@factory.vehicles).to be_a(Array)
      expect(@factory.vehicles.length).not_to eq(0)
    end
  end

  describe '#create_vehicles' do 
    it 'creates vehicle objects with attributes' do 
      @factory.add_wa_ev_source(@wa_ev_registrations)
      @factory.create_vehicles

      first_car = @factory.vehicles[0]

      expect(@factory.vehicles).to be_a(Array)
      expect(first_car).to be_a(Vehicle)
      expect(first_car.vin).not_to be nil
      expect(first_car.year).not_to be nil
      expect(first_car.make).not_to be nil
      expect(first_car.model).not_to be nil
      expect(first_car.engine).to eq(:ev)
      expect(first_car.registration_date).to be nil
      expect(first_car.plate_type).to be nil
    end
  end

  describe 'EV Analytics' do
    it '#most_popular_cars' do
      @factory.add_wa_ev_source(@wa_ev_registrations)
      @factory.create_vehicles
      most_popular_car = @factory.most_popular_car
      
      # method will return most popular car with make and model attributes.
      expect(most_popular_car).to be_a(Hash)
      expect(most_popular_car).to have_key(:make)
      expect(most_popular_car).to have_key(:model)
    end

    it 'can count registered vehicles by model and year' do 
      @factory.add_wa_ev_source(@wa_ev_registrations)
      @factory.create_vehicles
      count_mod_yr = @factory.count_mod_yr("Model 3", 2018)
      
      expect(count_mod_yr).to be_an(Integer)
    end
  end
end