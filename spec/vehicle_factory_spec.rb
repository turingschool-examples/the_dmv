require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe '#initialize' do
    it 'can initialize a factory' do
      @factory = VehicleFactory.new

      expect(@factory).to be_a(VehicleFactory)
      expect(@factory.vehicles).to eq([])
    end
  end
end
