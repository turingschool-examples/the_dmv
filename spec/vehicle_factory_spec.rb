require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end
  describe 'initialize' do
    it 'can initialize' do

      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
  
  describe '#create_vehicles' do
    it 'returns vehicles from the factory' do

      expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a(Vehicle)
    end
  end

  describe '#most_popular' do
    it 'returns the vehicle make and model that is most popular' do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.most_popular).to eq("NISSAN Leaf")
    end
  end

  describe '#count_by_year' do
    it 'returns the count of vehicles for a model year' do
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.count_by_year).to eq([["2023", 56], ["2022", 84], ["2021", 113], ["2020", 66], ["2019", 87], ["2018", 138], ["2017", 78], ["2016", 105], ["2015", 57], ["2014", 68], ["2013", 90], ["2012", 33], ["2011", 25]])
    end
  end

  describe '#county_with_the_most_vehicles' do 
    it 'returns the county with the most amount of vehicles' do
      @factory.create_vehicles(@wa_ev_registrations)

      expect(@factory.county_with_the_most_vehicles).to eq(["King", 799])
    end
  end
end