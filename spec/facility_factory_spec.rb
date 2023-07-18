require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "#initialize" do
    it "exists" do
      ff = FacilityFactory.new

      expect(ff).to be_a FacilityFactory
    end
  end
end