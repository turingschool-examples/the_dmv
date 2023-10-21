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

  # describe 'EV Registrations - #most_popular_ev' do
  #   it 'can iterate through the list and find the most popular make/model' do
  #     wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  #     @factory.create_vehicles(wa_ev_registrations)


  #     expect(@factory.most_popular_ev).to eq()
  #   end

  end

end