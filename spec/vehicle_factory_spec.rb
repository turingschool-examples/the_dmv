require 'spec_helper'

Rspec.describe VehicleFactory do
  describe '#initialize' do
    it 'can initialize' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end
end