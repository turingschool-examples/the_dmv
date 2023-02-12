require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#initialize' do
    it 'instance of factory' do
      factory = VehicleFactory.new

      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#ev_registrations' do
    it 'has data' do
      factory = VehicleFactory.new
      wa_ev_registrations = DmvDataService.new.wa_ev_registrations
      cars = factory.create_vehicles(wa_ev_registrations) 

      expect(cars).to be_a(Array)
      expect(cars.first).to be_a(Vehicle)
      expect(cars.length).to eq(1000)
    end
  end
end
