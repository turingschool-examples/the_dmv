require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @vehicle_factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@vehicle_factory).to be_an_instance_of(VehicleFactory)
      expect(@vehicle_factory.vehicles).to eq([])
    end
  end
end