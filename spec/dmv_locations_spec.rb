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

  describe 'Oregon Locations' do
    it 'can create Oregon DMV locations' do
      
      or_dmv = DmvDataService.new.or_dmv_office_locations
      @dmv.or_locations(or_dmv)
     
      expect(@dmv.locations[1].name).to eq('Ashland DMV Office')
      expect(@dmv.locations[1].address).to eq("600 Tolman Creek Rd")
      expect(@dmv.locations[1].phone).to eq("541-776-6092")
    end
  end

  describe 'New York Locations' do
    it 'can create NY DMV locations' do

      ny_dmv = DmvDataService.new.ny_dmv_office_locations
      @dmv.ny_locations(ny_dmv)

      expect(@dmv.locations[0].name).to eq("JAMESTOWN")
      expect(@dmv.locations[0].phone).to eq("7166618220")
      expect(@dmv.locations[0].address).to eq("512 WEST 3RD STREET")
    end
  end
end