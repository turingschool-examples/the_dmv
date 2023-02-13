require 'spec_helper'

RSpec.describe DMVLocation do
  before(:each) do
    @dmv = DMVLocation.new
  end

  describe 'Initialize' do
    it 'exists' do
      expect(@dmv).to be_a(DMVLocation)
    end
  end

  describe 'List Locations' do
    it 'can list DMV locations' do
      oregon_dmv = DmvDataService.new.or_dmv_office_locations
    end
  end
end