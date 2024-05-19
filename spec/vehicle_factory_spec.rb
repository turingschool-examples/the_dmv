require 'spec_helper'

RSpec.describe VehicleFactory do
  describe '#create_vehicles' do
    it 'returns an array' do
      factory = VehicleFactory.new
      vehicles = factory.create_vehicles([])

      expect(vehicles).to be_an_instance_of(Array)
    end
  end
end
