require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wav_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'can create vehicles' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles).to be_an_instance_of(Array)
      expect(vehicles.count).to eq(1000)
    end

    it 'assigns a vin attribute to each Vehicle object' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles[0].vin).to eq("WMEEJ9AA7E")
      expect(vehicles[vehicles.count - 1].vin).to eq("JTDKARFP8J")
    end

    it 'assigns a year attribute to each Vehicle object' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles[0].year).to eq(2014)
      expect(vehicles[vehicles.count - 1].year).to eq(2018)
    end

    it 'assigns a make attribute to each Vehicle object' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles[0].make).to eq("SMART")
      expect(vehicles[vehicles.count - 1].make).to eq("TOYOTA")
    end
    
    it 'assigns a model attribute to each Vehicle object' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles[0].model).to eq("Fortwo Electric Drive")
      expect(vehicles[vehicles.count - 1].model).to eq("Prius Prime")
    end

    it 'assigns an :ev engine type attribute to every Vehicle object' do
      vehicles = @factory.create_vehicles(@wav_ev_registrations)
      expect(vehicles[0].engine).to eq(:ev)
      expect(vehicles[vehicles.count - 1].engine).to eq(:ev)
    end
  end

end