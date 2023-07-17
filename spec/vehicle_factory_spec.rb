require 'spec_helper'
require './lib/dmv_data_service'
require './lib/vehicle'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)

      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(factory.create_vehicles(wa_ev_registrations)).to be_an(Array)
      expect(factory.vehicle_list.first).to be_an_instance_of(Vehicle) 
      expect(factory.vehicle_list.last).to be_an_instance_of(Vehicle)
      expect(factory.vehicle_list.length).to be_an(Integer)
    end
  end

  describe '#popular' do
    it 'find most popular make, model, year, and county' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)

      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(factory.create_vehicles(wa_ev_registrations)).to be_an(Array)
      expect(factory.vehicle_list.first).to be_an_instance_of(Vehicle) 
      expect(factory.vehicle_list.last).to be_an_instance_of(Vehicle)
      expect(factory.vehicle_list.length).to be_an(Integer)

      expect(factory.most_popular_registered_make).to eq("TESLA")
      expect(factory.most_popular_registered_model).to eq("Leaf")
      expect(factory.most_popular_registered_year).to eq("2018")
      expect(factory.most_popular_registered_county).to eq("King")
    end
  end
end