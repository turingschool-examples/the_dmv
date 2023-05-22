require "spec_helper"

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @facility_1 = Facility.new({
      name: "Albany DMV Office", 
      address: "2242 Santiam Hwy SE Albany OR 97321", 
      phone: "541-967-2014" })
    @facility_2 = Facility.new({
      name: "Ashland DMV Office", 
      address: "600 Tolman Creek Rd Ashland OR 97520", 
      phone: "541-776-6092" })
    @facility_3 = Facility.new({
      name: "Bend DMV Office", 
      address: "63030 O B Riley Rd Bend OR 97701", 
      phone: "541-388-6322" })
    
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @ny_office_1 = Facility.new({
      name: "JAMAICA KIOSK",
      address: "168-46 91ST AVE., 2ND FLR",
      phone: nil })
    @ny_office_2 = Facility.new({
      name: "ROCKESTER DOWNTOWN",
      address: "200 E. MAIN STREET",
      phone: "5857531604"})
    
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    @mo_office_1 = Facility.new({
      name: "FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE",
      address: "10425 WEST FLORISSANT",
      phone: "(314) 733-5316"
    })
    @mo_office_2 = Facility.new({
      name: "BONNE TERRE",
      address: "30 N ALLEN ST",
      phone: "(573) 358-3584"
    })
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
      expect(@or_dmv_office_locations).to be_an_instance_of(Array)
      expect(@new_york_facilities).to be_an_instance_of(Array)
    end
  end

  describe "#add facilities" do
    it "can add available facilities" do
      expect(@dmv.facilities).to eq([])
      @dmv.add_facility(@facility_1)
      expect(@dmv.facilities).to eq([@facility_1])
    end
  end

  describe "#facilities_offering_service" do
    it "can return list of facilities offering a specified Service" do
      @facility_1.add_service("New Drivers License")
      @facility_1.add_service("Renew Drivers License")
      @facility_2.add_service("New Drivers License")
      @facility_2.add_service("Road Test")
      @facility_2.add_service("Written Test")
      @facility_3.add_service("New Drivers License")
      @facility_3.add_service("Road Test")

      @dmv.add_facility(@facility_1)
      @dmv.add_facility(@facility_2)
      @dmv.add_facility(@facility_3)

      expect(@dmv.facilities_offering_service("Road Test")).to eq([@facility_2, @facility_3])
    end
  end

  describe "#add Oregon offices" do
    it "can create facility objects from Oregon data" do
      expect(@dmv.create_facilities(@or_dmv_office_locations)).to be_an_instance_of(Array)
      expect(@dmv.create_facilities(@or_dmv_office_locations).first.first.name).to eq("Albany DMV Office")
      expect(@dmv.create_facilities(@or_dmv_office_locations).first.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
    end
  end

  describe "#add New York offices" do
    it "can create facility objects from New York data" do
      expect(@dmv.create_facilities(@new_york_facilities)).to be_an_instance_of(Array)
      expect(@dmv.create_facilities(@new_york_facilities).first.first.name).to eq("JAMAICA KIOSK")
      expect(@dmv.create_facilities(@new_york_facilities).first[1].address).to eq("200 E. MAIN STREET")
    end
  end

  describe "#add Missouri offices" do
    it "can create facility objects from Missouri data" do
      expect(@dmv.create_facilities(@missouri_facilities)).to be_an_instance_of(Array)
      expect(@dmv.create_facilities(@missouri_facilities).first.first.address).to eq("10425 WEST FLORISSANT")
      expect(@dmv.create_facilities(@missouri_facilities).first[1].phone).to eq("(573) 358-3584")
    end
  end
end
