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

  describe 'Missouri Locations' do
    it 'can create MO DMV locations' do

      mo_dmv = DmvDataService.new.mo_dmv_office_locations
      @dmv.mo_locations(mo_dmv)

      expect(@dmv.locations[0].name).to eq("SAINTE GENEVIEVE ")
      expect(@dmv.locations[0].phone).to eq("(573) 883-2344")
      expect(@dmv.locations[0].address).to eq("753 STE. GENEVIEVE DR")
    end
  end
end
# [{:number=>"153",
#   :dorregionnumber=>"10",
#   :type=>"1MV",
#   :name=>"SAINTE GENEVIEVE ",
#   :address1=>"753 STE. GENEVIEVE DR",
#   :city=>"STE GENEVIEVE ",
#   :state=>"MO",
#   :zipcode=>"63670",
#   :county=>"Ste. Genevieve",
#   :phone=>"(573) 883-2344",
#   :fax=>"(573) 880-5062",
#   :size=>"1",
#   :email=>"SAINTEGENEVIEVEAGENTOFFICE@DOR.MO.GOV",