require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#Iteration 2: Reading from External Data Sets' do
    it 'can create vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      
      expect(@factory.create_vehicles(wa_ev_registrations)[0]).to be_an_instance_of(Vehicle)
    end
  end

  describe '#Iteration 4 Part 2' do
    it 'can find most popular make of imported vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.most_pop_make).to eq("TESLA")
    end

    it 'can find most popular model of imported vehicles' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.most_pop_model).to eq("Leaf")
    end

    it 'can give count of registered vehicles per model year' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.registrations_per_model_year(2016)).to eq(28)
      expect(@factory.registrations_per_model_year(2020)).to eq(27)
    end

    it 'can give county with most vehicles registered' do
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations

      @factory.create_vehicles(wa_ev_registrations)

      expect(@factory.most_reg_county).to eq("King")
    end
  end
end