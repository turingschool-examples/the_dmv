require 'spec_helper'

RSpec.describe VehicleFactory do
  lbefore(:factory) { VehicleFactory.new}
  
  it 'exists' do
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  describe '#create vehicles helper' do
    before(:each) { @wa_ev_registrations = DmvDataService.new.wa_ev_registrations }
    it 'extracts needed elements from each object in the given registration data' do
      data = factory.create_vehicles_helper(@wa_ev_registrations)
      expect(data).to be_an_instance_of(Array)
      expect(data.first).to eq({:vin=>"1N4AZ0CPXF", :year=>2015, :make=>"NISSAN", :model=>"Leaf", :engine=>:ev})
      expect(data.length).to eq(@wa_ev_registrations.length)
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