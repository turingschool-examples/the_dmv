require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
  end

  describe "#initialize" do
    it "exists" do
      expect(@factory).to be_a FacilityFactory
    end
  end




end