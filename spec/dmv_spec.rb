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
      name: "OAKVILLE",
      address: "3164 TELEGRAPH ROAD",
      phone: "(314) 887-1050"
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

  describe "#oregon_parse" do
    it "can parse oregon data" do
      oregon_parse = @dmv.oregon_parse(@or_dmv_office_locations).first
      expect(oregon_parse[:name]).to eq(@facility_1.name) 
      expect(oregon_parse[:address]).to eq(@facility_1.address) 
      expect(oregon_parse[:phone]).to eq(@facility_1.phone) 
    end
  end

  describe "#new_york_parse" do
    it "can parse new_york" do
      new_york_parse = @dmv.new_york_parse(@new_york_facilities).first

      expect(new_york_parse[:name]).to eq(@ny_office_1.name)
      expect(new_york_parse[:address]).to eq(@ny_office_1.address)
      expect(new_york_parse[:phone]).to eq(@ny_office_1.phone)
    end
  end

  describe "#missouri_parse" do
    it "can parse missouri" do
      missouri_parse = @dmv.missouri_parse(@missouri_facilities).first

      expect(missouri_parse[:name]).to eq(@mo_office_1.name)
      expect(missouri_parse[:address]).to eq(@mo_office_1.address)
      expect(missouri_parse[:phone]).to eq(@mo_office_1.phone)
    end
  end

  describe "#parse_states_data" do
    it "can parse oregon data" do
      parse_oregon_data = @dmv.parse_states_data(@or_dmv_office_locations)
      expect(parse_oregon_data).to eq(@dmv.oregon_parse(@or_dmv_office_locations))
    end

    it "can parse new york data" do
      parse_new_york_data = @dmv.parse_states_data(@new_york_facilities)
      expect(parse_new_york_data).to eq(@dmv.new_york_parse(@new_york_facilities))
    end

    it "can parse missouri data" do
      missouri_data = @dmv.parse_states_data(@missouri_facilities)
      expect(missouri_data).to eq(@dmv.missouri_parse(@missouri_facilities))
    end
  end

  describe "#create_facilities" do
    it "can add oregon facilities" do
      oregon_facilities = @dmv.create_facilities(@or_dmv_office_locations)
      expect(oregon_facilities.count).to eq(@dmv.facilities.count)
      expect(oregon_facilities.first.first).to eq(@dmv.facilities.first)
      expect(oregon_facilities.first.first.name).to eq(@facility_1.name)
    end

    it "can add new york facilities" do
      new_york_data = @dmv.create_facilities(@new_york_facilities)
      expect(new_york_data.first.first.name).to eq(@ny_office_1.name)
      expect(new_york_data.first.first.address).to eq(@ny_office_1.address)
      expect(new_york_data.first.first.phone).to eq(@ny_office_1.phone)
    end

    it "can add missouri facilities" do
      missouri_data = @dmv.create_facilities(@missouri_facilities)
      expect(missouri_data.count).to eq(@dmv.facilities.count)
      expect(missouri_data.first.first).to eq(@dmv.facilities.first)
      expect(missouri_data.first.first.address).to eq(@mo_office_1.address)
    end
  end
end
