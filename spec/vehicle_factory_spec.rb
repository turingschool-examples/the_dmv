require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @test_vehicle_1 = {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
    :vin_1_10=>"JTDKN3DP8D",
    :model_year=>"2013",
    :make=>"TOYOTA",
    :model=>"Prius Plug-in",
    :transaction_year=>"2019",
    :county=>"King",
    :city=>"RENTON",
    :state_of_residence=>"WA",
    :zip=>"98056"}
    @test_vehicle_2 = {:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
    :vin_1_10=>"JTDKARFP9J",
    :model_year=>"2018",
    :make=>"TOYOTA",
    :model=>"Prius Prime",
    :transaction_year=>"2022",
    :county=>"Pierce",
    :city=>"DUPONT",
    :state_of_residence=>"WA",
    :zip=>"98327"}
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a VehicleFactory
    end
  end

  describe '#create_vehicles' do
    it 'can create multiple vehicle objects' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      expect(vehicles).to be_a Array
      expect(vehicles.first).to be_a Vehicle
      expect(vehicles.last).to be_a Vehicle
      expect(vehicles.sample).to be_a Vehicle
    end

    it 'can create vehicle objects for all vehicles in data set' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)

      expect(vehicles.count).to eq(@wa_ev_registrations.count)
    end

    it 'can add attributes to the vehicle objects' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)

      expect(vehicles.sample.vin.length).to eq(10)
      expect(vehicles.sample.year.length).to eq(4)
      expect(vehicles.sample.make).to be_a String
      expect(vehicles.sample.model).to be_a String
      expect(vehicles.sample.engine).to eq(:ev)
      expect(vehicles.sample.plate_type).to eq(nil)
      expect(vehicles.sample.registration_date).to eq(nil)
    end

    it 'adds the correct data for each vehicle attribute' do
      vehicles = @factory.create_vehicles(@wa_ev_registrations)
      new_vehicle_1 = vehicles[0]
      new_vehicle_2 = vehicles[1]

      expect(new_vehicle_1.vin).to eq(@test_vehicle_1[:vin_1_10])
      expect(new_vehicle_2.vin).to eq(@test_vehicle_2[:vin_1_10])
      expect(new_vehicle_1.year).to eq(@test_vehicle_1[:model_year])
      expect(new_vehicle_2.year).to eq(@test_vehicle_2[:model_year])
      expect(new_vehicle_1.make).to eq(@test_vehicle_1[:make])
      expect(new_vehicle_2.make).to eq(@test_vehicle_2[:make])
      expect(new_vehicle_1.model).to eq(@test_vehicle_1[:model])
      expect(new_vehicle_2.model).to eq(@test_vehicle_2[:model])
      expect(new_vehicle_1.county).to eq(@test_vehicle_1[:county])
      expect(new_vehicle_2.county).to eq(@test_vehicle_2[:county])
    end
  end
end
