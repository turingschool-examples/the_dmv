require './spec/spec_helper'
require './lib/facility_builder'

RSpec.describe FacilityBuilder do
  describe "Oregon" do
    before(:each) do
      @or_state_facilities = FacilityBuilder.new
      @or_facilities = DmvDataService.new.or_dmv_office_locations
      @or_state_facilities.create_facilities(@or_facilities)
    end

    xit "pulls data from remote source" do
      expect(@or_facilities).to be_a(Array)
      p @or_facilities.count
      p @or_facilities[0].keys
      p @or_facilities[0][:title]
      p @or_facilities[0].values
    end

    xit "exists" do
      expect(@or_state_facilities).to be_a(FacilityBuilder)
      expect(@or_state_facilities.state_facility_list).to be_a(Array)
      expect(@or_state_facilities.state_facility_list.count).to eq(59)
    end

    xit "has the expected keys" do
      for i in 0..@or_state_facilities.state_facility_list.count - 1
        expect(@or_state_facilities.state_facility_list[i].keys).to eq([:name, :address, :phone])
      end
    end

    xit "has the expected values" do
      p @or_state_facilities.state_facility_list[0][:address]
      expect(@or_state_facilities.state_facility_list[0].values). to eq(["Albany DMV Office", "2242 Santiam Hwy SE Albany, OR 97321", "541-967-2014"])
    end

    xit "is the correct length" do
      expect(@or_state_facilities.state_facility_list.count).to eq(59)
    end

    xit "has a working or_address_cleaner method" do
      expect(@or_state_facilities.or_address_cleaner("{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}")).to eq("2242 Santiam Hwy SE Albany, OR 97321")
    end
  end

  describe "New York" do
    before(:each) do
      @ny_state_facilities = FacilityBuilder.new
      @ny_facilities = DmvDataService.new.ny_dmv_office_locations
      @ny_state_facilities.create_facilities(@ny_facilities)
    end

    xit "pulls data from remote source" do
      expect(@ny_facilities).to be_a(Array)
      p @ny_facilities.count
      p @ny_facilities[0].keys
      p @ny_facilities[0].values
    end

    xit "exists" do
      expect(@ny_state_facilities).to be_a(FacilityBuilder)
      expect(@ny_state_facilities.state_facility_list).to be_a(Array)
      expect(@ny_state_facilities.state_facility_list.count).to eq(169)
    end

    xit "has the expected keys" do
      for i in 0..@ny_state_facilities.state_facility_list.count - 1
        expect(@ny_state_facilities.state_facility_list[i].keys).to eq([:name, :address, :phone])
      end
    end

    xit "has the expected values" do
      p @ny_state_facilities.state_facility_list[0][:address]
      expect(@ny_state_facilities.state_facility_list[0].values). to eq(["JAMESTOWN", "512 WEST 3RD STREET JAMESTOWN, NY 14701", "7166618220"])
    end
  end

  describe "Missouri" do
    before(:each) do
      @mo_state_facilities = FacilityBuilder.new
      @mo_facilities = DmvDataService.new.mo_dmv_office_locations
      @mo_state_facilities.create_facilities(@mo_facilities)
    end

    xit "pulls data from remote source" do
      expect(@mo_facilities).to be_a(Array)
      p @mo_facilities.count
      p @mo_facilities[0].keys
      p @mo_facilities[0].values
    end

    xit "exists" do
      expect(@mo_state_facilities).to be_a(FacilityBuilder)
      expect(@mo_state_facilities.state_facility_list).to be_a(Array)
      expect(@mo_state_facilities.state_facility_list.count).to eq(178)
    end

    it "has the expected keys" do
      for i in 0..@mo_state_facilities.state_facility_list.count - 1
        expect(@mo_state_facilities.state_facility_list[i].keys).to eq([:name, :address, :phone, :daily_hours, :holidays])
      end
    end

    it "has the expected values" do
      p @mo_state_facilities.state_facility_list[0][:address]
      expect(@mo_state_facilities.state_facility_list[0].values). to eq(
        ["SAINTE GENEVIEVE ", 
         "753 STE. GENEVIEVE DR STE GENEVIEVE, MO 63670", 
         "(573) 883-2344", 
         "Monday - Friday - 8:30 to 5:00, Last 4 week days - 8:00 to 5:00",
         "Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)"])
    end
  end

  describe "additional facility info" do
    before(:each) do 
    @mo_state_facilities = FacilityBuilder.new
    @mo_facilities = DmvDataService.new.mo_dmv_office_locations
    @mo_state_facilities.create_facilities(@mo_facilities)
    @ny_state_facilities = FacilityBuilder.new
    @ny_facilities = DmvDataService.new.ny_dmv_office_locations
    @ny_state_facilities.create_facilities(@ny_facilities)
  end

    it "can give open hours for Missouri" do
      expect(@mo_state_facilities).to be_a(FacilityBuilder)
      expect(@mo_state_facilities.state_facility_list[0][:daily_hours]).to eq("Monday - Friday - 8:30 to 5:00, Last 4 week days - 8:00 to 5:00")
    end

    it "can give open hours for New York" do
      expect(@ny_state_facilities).to be_a(FacilityBuilder)
      p @ny_state_facilities.state_facility_list[0][:daily_hours]
      expect(expect(@ny_state_facilities.state_facility_list[0][:daily_hours]).to eq("Monday: 8:30 AM - 4:15 PM Tuesday: 8:30 AM - 4:15 PM Wednesday: 8:30 AM - 4:15 PM Thursday: 8:30 AM - 5:45 PM Friday: 8:30 AM - 4:15 PM"))
    end

    it "Missouri hash includes holidays" do
      expect(@mo_state_facilities.state_facility_list[0][:holidays]).not_to be_nil
      expect(@mo_state_facilities.state_facility_list[0][:holidays]).to eq("Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
    end
  end
end