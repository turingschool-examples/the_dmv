require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe 'Initialize' do
    it 'exists' do

      expect(@factory).to be_a(VehicleFactory)
    end
  end
end