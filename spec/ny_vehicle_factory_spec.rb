require 'spec_helper'

RSpec.describe NyVehicleFactory do
  before(:each) do
    @factory = NyVehicleFactory.new
    @ny_registrations = DmvDataService.new.ny_registrations
  end
  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(NyVehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'creates vehicles from given source' do
      expect(@factory.create_vehicles(@ny_registrations)).to be_an_instance_of(Array)
      expect(@factory.create_vehicles(@ny_registrations)[0]).to be_an_instance_of(Vehicle)
    end
  end

  describe '#filter_cars' do
    it 'creates and array of only cars' do
        expect(@factory.filter_cars(@ny_registrations)).to be_an_instance_of(Array)
        expect(@factory.filter_cars(@ny_registrations)[0][:record_type]).to eq ('VEH')
    end
  end

end