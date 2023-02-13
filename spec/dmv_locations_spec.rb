require 'spec_helper'

RSpec.describe DMVLocations do
  before(:each) do
    @dmv = DMVLocation.new
  end

  describe 'Initialize' do
    it 'exists' do
      expect(@dmv).to be_a(DMVLocation)
    end
  end
end