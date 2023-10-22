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
    it 'can create vehicles with an API' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.vehicles).to include(Vehicle)
      expect(@factory.vehicles.length).to be > 100

        @factory.vehicles.each do |car|
          expect(car).to be_an_instance_of(Vehicle)
          expect(car.vin.nil?).to eq(false)
          expect(car.year.nil?).to eq(false)
          expect(car.make.nil?).to eq(false)
          expect(car.model.nil?).to eq(false)
          expect(car.engine.nil?).to eq(false)
        end
      end
    end

  describe '#make_and_models' do
    it 'can make a hash of make and models with the list of vehicles created' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.make_and_models).to be_an_instance_of(Hash)
      expect(@factory.make_and_models.keys.include?("TESLA")).to be(true)
      expect(@factory.make_and_models.keys.include?("NISSAN")).to be(true)
      expect(@factory.make_and_models.keys.include?("TOYOTA")).to be(true)
      expect(@factory.make_and_models.values).to be_an_instance_of(Array)
    end
  end

  describe 'EV Registrations - #most_popular_ev' do
    it 'can iterate through the list and find the most popular make/model' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)
      @factory.most_popular_ev

      expect(@factory.most_popular_ev).to eq("The most popular make and model is the NISSAN Leaf!")
    end
  end

  describe '#registered_vehicles_for_model_year' do
    it 'can count the number of registered vehicles for a model year' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.registered_vehicles_for_model_year("2013")).to eq(107)
      expect(@factory.registered_vehicles_for_model_year(2013)).to eq("Error, try a string")
      expect(@factory.registered_vehicles_for_model_year("12")).to eq("Year must be 4 characters long")
      expect(@factory.registered_vehicles_for_model_year("2025")).to eq(    "Year is too early for EVs or in the future")
    end
  end
end