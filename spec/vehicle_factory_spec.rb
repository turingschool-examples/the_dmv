require 'rspec'
require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    it 'can initialize' do
    cowans_vehicle_factory = VehicleFactory.new

    expect(cowans_vehicle_factory).to be_a(VehicleFactory)
    end
  end

  describe 'can make cars' do
    it 'can import external data' do
    cowans_vehicle_factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)

    expect(cowans_vehicle_factory.vehicle_data.length).to eq(1000)
    end

    it 'can manufacture vehicles' do
    cowans_vehicle_factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)

    expect(cowans_vehicle_factory.manufactured_vehicle_count).to eq(1000)
    end
  end

  describe 'analyze data' do
    it 'can list most popular make' do
    cowans_vehicle_factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)

    expect(cowans_vehicle_factory.most_popular_make).to eq("TESLA")
    end

    it 'can list most popular model' do
      cowans_vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)
  
      expect(cowans_vehicle_factory.most_popular_model).to eq("Leaf")
    end

    it 'can count by model year' do
      cowans_vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)
  
      expect(cowans_vehicle_factory.count_by_year("2020")).to eq(71)
    end

    it 'can show most registered county' do
      cowans_vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      cowans_vehicle_factory.manufacture_vehicles(wa_ev_registrations)
  
      expect(cowans_vehicle_factory.county_with_most_registrations).to eq("King")
    end

    it 'can import ny external data' do
      cowans_vehicle_factory = VehicleFactory.new
      ny_registrations = DmvDataService.new.ny_registrations
      cowans_vehicle_factory.manufacture_vehicles(ny_registrations)
  
      expect(cowans_vehicle_factory.vehicle_data.length).to eq(1000)
      end
  end
end