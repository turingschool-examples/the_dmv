require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_a VehicleFactory
    end
  end
  







end