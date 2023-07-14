require 'spec_helper'

RSpec.describe VehicleFactory do
  describe "#initialize" do
    it "exists" do
      factory = VehicleFactory.new

      expect(factory).to be_a(VehicleFactory)
    end
  end
end