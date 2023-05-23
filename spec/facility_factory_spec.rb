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
      facilities = @facility_factory.create_facility(@or_dmvs)
      first_facility = facilities.first
      
      expect(facilities).to be_a(Array)
      expect(facilities.count).to eq(59)
      expect(first_facility).to be_a(Facility)
    end
  end

end


# facility = Facility.new({
#   name: # :title (STRING)
#   address: # :location_1[:human_address]
#   phone: #:phone_number (STRING)
# })



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



  #{:office_name=>"JAMAICA KIOSK",
  # :office_type=>"DISTRICT OFFICE",
  # :street_address_line_1=>"168-46 91ST AVE., 2ND FLR",
  # :city=>"JAMAICA",
  # :state=>"NY",
  # :zip_code=>"11432",
  # :monday_beginning_hours=>"7:30 AM",
  # :monday_ending_hours=>"5:00 PM",
  # :tuesday_beginning_hours=>"7:30 AM",
  # :tuesday_ending_hours=>"5:00 PM",
  # :wednesday_beginning_hours=>"7:30 AM",
  # :wednesday_ending_hours=>"5:00 PM",
  # :thursday_beginning_hours=>"7:30 AM",
  # :thursday_ending_hours=>"5:00 PM",
  # :friday_beginning_hours=>"7:30 AM",
  # :friday_ending_hours=>"5:00 PM",
  # :georeference=>{:type=>"Point", :coordinates=>[-73.79219, 40.70742]},
  # :":@computed_region_yamh_8v7k"=>"196",
  # :":@computed_region_wbg7_3whc"=>"1216",
  # :":@computed_region_kjdx_g34t"=>"2137"}



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
