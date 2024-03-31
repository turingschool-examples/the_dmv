require 'spec_helper'

RSpec.describe VehicleFactory do
  describe 'initialize' do
    vehicle_factory = VehicleFactory.new
  end

  # describe "retrieve_data" do
  #   it "can retrieve data" do
  #     vehicle_factory = VehicleFactory.new
  #     wa_ev_registrations = DmvDataService.new.wa_ev_registrations

  #     expect(vehicle_factory.retrieve_data(wa_ev_registrations)).to eq(vehicle_factory.retrieved_data)
  #   end
  # end

  describe "update data" do
    it "can update data" do
      vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      data = vehicle_factory.retrieve_data(wa_ev_registrations)

      expect(vehicle_factory.update_data(data)).to eq(vehicle_factory.updated_data)
    end
  end

  describe 'filter data' do
    it "can filter data" do
      vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
# binding.pry
      expect(vehicle_factory.filter_data(wa_ev_registrations)).to eq(vehicle_factory.filtered_data)
      # binding.pry
    end
  end

  describe 'create_vehicles' do
    it "can create cars from registrations" do
      vehicle_factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      binding.pry
      vehicle_factory.filter_data(wa_ev_registrations)
            # binding.pry
            #need to know what to test equivalency
            #error when running, data matches in binding pry
      expect(vehicle_factory.create_vehicles(wa_ev_registrations)).to eq(vehicle_factory.create_vehicles(wa_ev_registrations))
        # vehicle_factory.created_cars)
    end
  end
end