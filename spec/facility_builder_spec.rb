require './spec/spec_helper'
require './lib/facility_builder'

RSpec.describe FacilityBuilder do
  describe "Oregon" do
    before(:each) do
      @or_state_facilities = FacilityBuilder.new
      @or_facilities = DmvDataService.new.or_dmv_office_locations
      @or_state_facilities.create_facilities(@or_facilities)
    end

    it "pulls data from remote source" do
      expect(@or_facilities).to be_a(Array)
      p @or_facilities.count
      p @or_facilities[0].keys
      p @or_facilities[0][:title]
      p @or_facilities[0].values
    end

    it "exists" do
      expect(@or_state_facilities).to be_a(FacilityBuilder)
      expect(@or_state_facilities.state_facility_list).to be_a(Array)
      expect(@or_state_facilities.state_facility_list.count).to eq(59)
    end

    it "has the expected keys" do
      for i in 0..@or_state_facilities.state_facility_list.count - 1
        expect(@or_state_facilities.state_facility_list[i].keys).to eq([:name, :address, :phone])
      end
    end

    it "has the expected values" do
      p @or_state_facilities.state_facility_list[0][:address]
      expect(@or_state_facilities.state_facility_list[0].values). to eq(["Albany DMV Office", "2242 Santiam Hwy SE Albany, OR 97321", "541-967-2014"])
    end

    it "is the correct length" do
      expect(@or_state_facilities.state_facility_list.count).to eq(59)
    end

    it "has a working or_address_cleaner method" do
      expect(@or_state_facilities.or_address_cleaner("{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}")).to eq("2242 Santiam Hwy SE Albany, OR 97321")
    end
  end

  describe "New York" do
    before(:each) do
      @ny_state_facilities = FacilityBuilder.new
      @ny_facilities = DmvDataService.new.ny_dmv_office_locations
      @ny_state_facilities.create_facilities(@ny_facilities)
    end

    it "pulls data from remote source" do
      expect(@ny_facilities).to be_a(Array)
      p @ny_facilities.count
      p @ny_facilities[0].keys
      p @ny_facilities[0].values
    end

    it "exists" do
      expect(@ny_state_facilities).to be_a(FacilityBuilder)
      expect(@ny_state_facilities.state_facility_list).to be_a(Array)
      expect(@ny_state_facilities.state_facility_list.count).to eq(169)
    end

    it "has the expected keys" do
      for i in 0..@ny_state_facilities.state_facility_list.count - 1
        expect(@ny_state_facilities.state_facility_list[i].keys).to eq([:name, :address, :phone])
      end
    end

    it "has the expected values" do
      p @ny_state_facilities.state_facility_list[0][:address]
      expect(@ny_state_facilities.state_facility_list[0].values). to eq(["JAMESTOWN", "512 WEST 3RD STREET", "7166618220"])
    end
  end

  describe "Missouri" do
    before(:each) do
      @mo_state_facilities = FacilityBuilder.new
      @mo_facilities = DmvDataService.new.mo_dmv_office_locations
      @mo_state_facilities.create_facilities(@mo_facilities)
    end

    it "pulls data from remote source" do
      expect(@mo_facilities).to be_a(Array)
      p @mo_facilities.count
      p @mo_facilities[0].keys
      p @mo_facilities[0].values
    end

    it "exists" do
      expect(@mo_state_facilities).to be_a(FacilityBuilder)
      expect(@mo_state_facilities.state_facility_list).to be_a(Array)
      expect(@mo_state_facilities.state_facility_list.count).to eq(178)
    end

    it "has the expected keys" do
      for i in 0..@mo_state_facilities.state_facility_list.count - 1
        expect(@mo_state_facilities.state_facility_list[i].keys).to eq([:name, :address, :phone])
      end
    end

    it "has the expected values" do
      p @mo_state_facilities.state_facility_list[0][:address]
      expect(@mo_state_facilities.state_facility_list[0].values). to eq(["SAINTE GENEVIEVE ", "753 STE. GENEVIEVE DR", "(573) 883-2344"])
    end
    
  end



  

end