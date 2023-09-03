require 'spec_helper'

RSpec.describe VehicleFactory do
  let(:factory) { VehicleFactory.new}
  
  describe '#initialize' do
    it 'can initialize' do
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end


  describe '#create vehicles' do
    before(:each) { @wa_ev_registrations = DmvDataService.new.wa_ev_registrations }
    it 'Will create an array of vehicles using a provided data set' do
      cars = factory.create_vehicles(@wa_ev_registrations)
      expect(cars).to be_an_instance_of(Array)
      expect(cars.length).to equal(@wa_ev_registrations.size)
    end

    it 'Will create an instance of Vehicle class for each element from wa ev registrations' do
      cars = factory.create_vehicles(@wa_ev_registrations)
      expect(cars.first).to be_an_instance_of(Vehicle)
    end
  end
end