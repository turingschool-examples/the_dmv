require "spec_helper"

describe "FacilityFactory" do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @or_dmvs = DmvDataService.new.or_dmv_office_locations
    @ny_dmvs = DmvDataService.new.ny_dmv_office_locations
    @mo_dmvs = DmvDataService.new.mo_dmv_office_locations
  end

  describe "#initialize" do
    it "exists" do
      expect(@facility_factory).to be_a(FacilityFactory)
    end
  end

  describe "#create_facilities" do
    it "returns an array of Facilities" do
      facilities = @facility_factory.create_facilities(@or_dmvs)
      first_facility = facilities.first
      
      expect(facilities).to be_a(Array)
      expect(facilities.count).to eq(59)
      expect(first_facility).to be_a(Facility)
    end
  end

  describe "#format_name" do
    it "can format a facility name from the Oregon API" do
      or_facility = @or_dmvs.first
      name_or = @facility_factory.format_name(or_facility)
      expect(name_or).to be_a(String)
    end
    
    it "can format a facility name from the New York API" do
      ny_facility = @ny_dmvs.first
      name_ny = @facility_factory.format_name(ny_facility)
      expect(name_ny).to be_a(String)
    end
  end
  
  describe "#format_address" do
    it "can format an address from the Oregon API" do
      or_facility = @or_dmvs.first
      special_or_facility = @or_dmvs.find { |facility| facility[:location_2] }

      address1 = @facility_factory.format_address(or_facility)
      address2 = @facility_factory.format_address(special_or_facility) 

      expect(address1).to be_a(String)
      expect(address2).to be_a(String)
    end
    
    it "can format an address from the New York API" do
      ny_facility = @ny_dmvs.first
      special_ny_facility = @ny_dmvs.find { |facility| facility[:street_address_line_2] }

      address1 = @facility_factory.format_address(ny_facility)
      address2 = @facility_factory.format_address(special_ny_facility) 

      expect(address1).to be_a(String)
      expect(address2).to be_a(String)
    end
  end
  
  describe "#format_phone" do
    it "can format a phone number from the Oregon API" do
      or_facility = @or_dmvs.first
      phone = @facility_factory.format_address(special_or_facility) 

      expect(address1).to be_a(String)
      expect(address2).to be_a(String)
    end
    
    it "can format an address from the New York API" do
      ny_facility = @ny_dmvs.first
      special_ny_facility = @ny_dmvs.find { |facility| facility[:street_address_line_2] }

      address1 = @facility_factory.format_address(ny_facility)
      address2 = @facility_factory.format_address(special_ny_facility) 

      expect(address1).to be_a(String)
      expect(address2).to be_a(String)
    end
  end

end


# facility = Facility.new({
#   name: # :title (STRING)
#   address: # :location_1[:human_address]
#   phone: #:phone_number (STRING)
# })


# ---------
# OR OFFICE
# ---------
# {
#   :title=>"Albany DMV Office",
#   :zip_code=>"97321",
#   :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx",
#   :type=>"DMV Location",
#   :phone_number=>"541-967-2014",
#   :agency=>"Transportation, Department of ",
#   :location_1=>{
#     :latitude=>"44.632897", 
#     :longitude=>"-123.077928", 
#     :human_address=>"{
#       \"address\": \"2242 Santiam Hwy SE\", 
#       \"city\": \"Albany\", 
#       \"state\": \"OR\", 
#       \"zip\": \"97321\"
#       }"
#     }
#   }

# ---------
# NY OFFICE
# ---------
# {
#   "office_name": "CANTON",
#   "office_type": "COUNTY OFFICE",
#   "public_phone_number": "3153861408",
#   "street_address_line_1": "80 STATE HIGHWAY 310",
#   "street_address_line_2": "SUITE 3",
#   "city": "CANTON",
#   "state": "NY",
#   "zip_code": "13617",
#   "monday_beginning_hours": "8:00 AM",
#   "monday_ending_hours": "4:00 PM",
#   "tuesday_beginning_hours": "8:00 AM",
#   "tuesday_ending_hours": "4:00 PM",
#   "wednesday_beginning_hours": "8:00 AM",
#   "wednesday_ending_hours": "4:00 PM",
#   "thursday_beginning_hours": "8:00 AM",
#   "thursday_ending_hours": "4:00 PM",
#   "friday_beginning_hours": "8:00 AM",
#   "friday_ending_hours": "4:00 PM",
#   "georeference": {
#     "type": "Point",
#     "coordinates": [
#       -75.15065,
#       44.60166
#     ]
#   },
#   ":@computed_region_yamh_8v7k": "339",
#   ":@computed_region_wbg7_3whc": "1478",
#   ":@computed_region_kjdx_g34t": "2140"
# },



  #{:number=>"059",
  # :dorregionnumber=>"5",
  # :type=>"1MV",
  # :name=>"FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE",
  # :address1=>"10425 WEST FLORISSANT",
  # :city=>"FERGUSON",
  # :state=>"MO",
  # :zipcode=>"63136",
  # :located_in=>"Personalized plates can be picked up at the North County License Office. ",
  # :county=>"St. Louis County",
  # :phone=>"(314) 733-5316",
  # :fax=>"(314) 733-5319",
  # :size=>"3",
  # :email=>"FERGUSONAGENTOFFICE@DOR.MO.GOV",
  # :latlng=>{:latitude=>"38.737935", :longitude=>"-90.220029"},
  # :textingphonenumber=>"(314) 730-0606",
  # :additional_license_office_info=>
  #  "Personalized plates can be picked up at the North County License office located at 11700 W Florissant, St. Louis, MO 63033.",
  # :":@computed_region_ny2h_ckbz"=>"203",
  # :":@computed_region_c8ar_jsdj"=>"51",
  # :":@computed_region_ikxf_gfzr"=>"2210"}
