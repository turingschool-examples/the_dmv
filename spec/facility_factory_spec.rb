require "spec_helper"

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @mock_oregon_facility = {
      title: "Condon DMV Office",
      zip_code: "97823",
      website: "http://www.oregon.gov/ODOT/DMV/pages/offices/condon.aspx",
      type: "DMV Location",
      phone_number: "541-384-2224",
      agency: "Transportation, Department of ",
      location_1: {
        latitude: "45.235128",
        longitude: "-120.185879",
        human_address: "{\"address\": \"221 S Oregon St\", \"city\": \"Condon\", \"state\": \"OR\", \"zip\": \"97823\"}"
      }
    }
    @mock_new_york_facility = {
      office_name: "GOUVERNEUR",
      office_type: "COUNTY OFFICE",
      public_phone_number: "3152877034",
      street_address_line_1: "1227 US HIGHWAY 11",
      city: "GOUVERNEUR",
      state: "NY",
      zip_code: "13642",
      monday_beginning_hours: "8:00 AM",
      monday_ending_hours: "4:00 PM",
      tuesday_beginning_hours: "8:00 AM",
      tuesday_ending_hours: "4:00 PM",
      wednesday_beginning_hours: "8:00 AM",
      wednesday_ending_hours: "4:00 PM",
      thursday_beginning_hours: "8:00 AM",
      thursday_ending_hours: "4:00 PM",
      friday_beginning_hours: "8:00 AM",
      friday_ending_hours: "4:00 PM",
      georeference: { type: "Point", coordinates: [-75.48089, 44.32487] },
      ":@computed_region_yamh_8v7k": "330",
      ":@computed_region_wbg7_3whc": "1525",
      ":@computed_region_kjdx_g34t": "2140"
    }
    @mock_missouri_facility = {
      number: "119",
      dorregionnumber: "1",
      type: "1MV",
      name: "CAMERON",
      address1: "508 LANA DR",
      city: "CAMERON",
      state: "MO",
      zipcode: "64429",
      county: "Clinton",
      phone: "(816) 632-4830",
      fax: "(816) 632-4831",
      size: "1",
      email: "CAMERONAGENTOFFICE@DOR.MO.GOV",
      agent: "CAMERON LICENSE OFFICE",
      officemanager: "BECKY CURTIS",
      daysopen: "Monday - Friday - 9:00 to 5:00, Last Saturday - 9:00 to 12:00",
      holidaysclosed: "Independence Day (07/04/22), Labor Day (09/05/22), Thanksgiving (11/24/22), "\
      "Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Memorial Day (05/29/23), "\
      "Independence Day (07/04/23), Labor Day (09/04/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)",
      additionaldaysclosed: "7/2/22, 9/3/22, 11/25/22, 11/26/22, 12/31/22, "\
      "5/27/23, 7/3/23, 9/2/23, 11/24/23, 11/25/23, 12/30/23  ",
      latlng: { latitude: "39.752195", longitude: "-94.233915" },
      facebook_url: "https://www.facebook.com/cameronlicense/",
      othercontactinfo: "Public E-Mail: Cameron@yorkmanagementgroup.com",
      additional_license_office_info: "MOTOR VEHICLE PHONE IN RENEWAL - (816) 632-4830 "\
      "Other Services and Initiatives: Office will have a greeter to ensure customers has proper documents, "\
      "Free Wi-Fi, Charging Station, and Take a Number System.",
      ":@computed_region_ny2h_ckbz": "67",
      ":@computed_region_c8ar_jsdj": "19",
      ":@computed_region_ikxf_gfzr": "519"
    }
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(FacilityFactory)
      expect(@factory.facilities).to eq([])
    end
  end

  describe "#determine_name" do
    it "can determine the name of a mock Oregon facility" do
      expect(@factory.determine_name(@mock_oregon_facility)).to eq("Condon DMV Office")
    end

    it "can determine the name of a mock New York facility" do
      expect(@factory.determine_name(@mock_new_york_facility)).to eq("GOUVERNEUR")
    end

    it "can determine the name of a mock Missouri facility" do
      expect(@factory.determine_name(@mock_missouri_facility)).to eq("CAMERON")
    end
  end

  describe "#determine_address" do
    it "can determine the address of a mock Oregon facility" do
      expect(@factory.determine_address(@mock_oregon_facility)).to eq("221 S Oregon St, Condon, OR 97823")
    end

    it "can determine the address of a mock New York facility" do
      expect(@factory.determine_address(@mock_new_york_facility)).to eq("1227 US HIGHWAY 11, GOUVERNEUR, NY 13642")
    end

    it "can determine the address of a mock Missouri facility" do
      expect(@factory.determine_address(@mock_missouri_facility)).to eq("508 LANA DR, CAMERON, MO 64429")
    end
  end

  describe "#determine_phone" do
    it "can determine the phone number of a mock Oregon facility" do
      expect(@factory.determine_phone(@mock_oregon_facility)).to eq("541-384-2224")
    end

    it "can determine the phone number of a mock New York facility" do
      expect(@factory.determine_phone(@mock_new_york_facility)).to eq("315-287-7034")
    end

    it "can determine the phone number of a mock Missouri facility" do
      expect(@factory.determine_phone(@mock_missouri_facility)).to eq("816-632-4830")
    end
  end

  describe "#create_facilities" do
    it "can create facilities from the Oregon database" do
      expect(@factory.facilities).to eq([])
      @factory.create_facilities(@oregon_facilities)
      expect(@factory.facilities.count).to be > 10

      expect(@factory.facilities.first).to be_an_instance_of(Facility)
      expect(@factory.facilities.first.name).to be_truthy
      expect(@factory.facilities.first.address).to be_truthy
      expect(@factory.facilities.first.phone).to be_truthy

      expect(@factory.facilities.last).to be_an_instance_of(Facility)
      expect(@factory.facilities.last.name).to be_truthy
      expect(@factory.facilities.last.address).to be_truthy
      expect(@factory.facilities.last.phone).to be_truthy
    end

    it "can create facilities from the New York database" do
      expect(@factory.facilities).to eq([])
      @factory.create_facilities(@new_york_facilities)
      expect(@factory.facilities.count).to be > 10

      expect(@factory.facilities.first).to be_an_instance_of(Facility)
      expect(@factory.facilities.first.name).to be_truthy
      expect(@factory.facilities.first.address).to be_truthy
      expect(@factory.facilities.first.phone).to be_truthy

      expect(@factory.facilities.last).to be_an_instance_of(Facility)
      expect(@factory.facilities.last.name).to be_truthy
      expect(@factory.facilities.last.address).to be_truthy
      expect(@factory.facilities.last.phone).to be_truthy
    end

    it "can create facilities from the Misssouri database" do
      expect(@factory.facilities).to eq([])
      @factory.create_facilities(@missouri_facilities)
      expect(@factory.facilities.count).to be > 10

      expect(@factory.facilities.first).to be_an_instance_of(Facility)
      expect(@factory.facilities.first.name).to be_truthy
      expect(@factory.facilities.first.address).to be_truthy
      expect(@factory.facilities.first.phone).to be_truthy

      expect(@factory.facilities.last).to be_an_instance_of(Facility)
      expect(@factory.facilities.last.name).to be_truthy
      expect(@factory.facilities.last.address).to be_truthy
      expect(@factory.facilities.last.phone).to be_truthy
    end
  end
end
