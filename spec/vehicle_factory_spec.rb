require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a(VehicleFactory)
    end
  end

  describe '#create_vehicles' do
    it 'returns an array' do
      expect(@factory.create_vehicles).to be_a(Array)
    end

    it 'returns an array of Vehicle objects' do
      expect(@factory.create_vehicles.all { |vehicle| vehicle.is_a?(Vehicle) }).to be(true)
    end
  end
end
