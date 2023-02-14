require 'spec_helper'

RSpec.describe NyVehicleFactory do
  before(:each) do
    @source = DmvDataService.new.ny_registrations
    @factory = NyVehicleFactory.new(@source)
  end
  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(NyVehicleFactory)
    end

    it 'has a source' do
      expect(@factory.source).to be_an_instance_of(Array)
    end
  end

  describe '#create_vehicles' do
    it 'creates vehicles from given source' do
      expect(@factory.create_vehicles(@source)).to be_an_instance_of(Array)
      expect(@factory.create_vehicles(@source)[0]).to be_an_instance_of(Vehicle)
    end
  end

  describe '#filter_cars' do
    it 'creates an array of only cars' do
        expect(@factory.filter_cars(@source)).to be_an_instance_of(Array)
        expect(@factory.filter_cars(@source)[0][:record_type]).to eq ('VEH')
    end
  end
end