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
    it 'find most popular make, model, year, count, and county' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)

      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      expect(factory.create_vehicles(wa_ev_registrations)).to be_an(Array)
      expect(factory.vehicle_list.first).to be_an_instance_of(Vehicle) 
      expect(factory.vehicle_list.last).to be_an_instance_of(Vehicle)
      expect(factory.vehicle_list.length).to be_an(Integer)

      expect(factory.most_popular_registered_make).to be_an(String)
      expect(factory.most_popular_registered_model).to be_an(String)
      expect(factory.most_popular_registered_year).to be_an(String)
      expect(factory.most_popular_registered_county).to be_an(String)
      expect(factory.model_count("2018")).to be_an(Integer)
    end
  end

  describe '#other vehicles' do
    it 'contains boats, trailers, ect' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
      
      ny_other_registrations = DmvDataService.new.ny_other_registrations
      
      expect(factory.create_other_vehicles(ny_other_registrations)).to be_an(Array)
      expect(factory.vehicle_list.first).to be_an_instance_of(Vehicle) 
      expect(factory.vehicle_list.last).to be_an_instance_of(Vehicle)
      expect(factory.vehicle_list.length).to be_an(Integer)

      expect(factory.most_popular_registered_make).to be_an(String)
      expect(factory.most_popular_registered_model).to be_an(String)
      expect(factory.most_popular_registered_year).to be_an(String)
      expect(factory.most_popular_registered_county).to be_an(String)
      expect(factory.model_count("2018")).to be_an(Integer)
    end
  end

  describe '#unit test' do
    it 'checking model count for empty list' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
      expect(factory.model_count("2018")).to be_an(Integer)
      expect(factory.model_count(2018)).to be_an(Integer)

      ny_other_registrations = DmvDataService.new.ny_other_registrations
      expect(factory.create_other_vehicles(ny_other_registrations)).to be_an(Array)
      
    end
  end
end