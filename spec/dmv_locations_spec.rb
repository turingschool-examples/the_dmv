require 'spec_helper'
require 'json'

RSpec.describe DMVLocation do
  before(:each) do
    @dmv = DMVLocation.new
  end

  describe 'Initialize' do
    it 'exists' do
      expect(@dmv).to be_a(DMVLocation)
    end
  end

  describe 'Create new Locations' do
    it 'can create DMV locations' do
      
      or_dmv = DmvDataService.new.or_dmv_office_locations
      @dmv.dmv_locations(or_dmv)
     
      expect(@dmv.locations[1].name).to eq('Ashland DMV Office')
      expect(@dmv.locations[1].address).to eq("600 Tolman Creek Rd")
      expect(@dmv.locations[1].phone).to eq("541-776-6092")
    end
  end
end