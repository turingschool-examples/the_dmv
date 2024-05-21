require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
                                :dmv_id=>"1",
                                :dmv_office=>"DMV Tremont Branch",
                                :address_li=>"2855 Tremont Place",
                                :address__1=>"Suite 118",
                                :city=>"Denver",
                                :state=>"CO",
                                :zip=>"80205",
                                :phone=>"(720) 865-4600",
                                :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
                                :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
                                :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
                                :photo=>"images/Tremont.jpg",
                                :address_id=>"175164",
                                :":@computed_region_nku6_53ud"=>"1444"},
                                {:the_geom=>{:type=>"Point", :coordinates=>[-104.84839592880655, 39.78135984611333]},
                                :dmv_id=>"2",
                                :dmv_office=>"DMV Northeast Branch",
                                :address_li=>"4685 Peoria Street",
                                :address__1=>"Suite 101",
                                :location=>"Arie P. Taylor  Municipal Bldg",
                                :city=>"Denver",
                                :state=>"CO",
                                :zip=>"80239",
                                :phone=>"(720) 865-4600",
                                :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
                                :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
                                :parking_no=>"parking available in both the front and back of the bldg; also on Paris Street",
                                :photo=>"images/Peoria.jpg",
                                :address_id=>"11348",
                                :":@computed_region_nku6_53ud"=>"1444"}]
    @ny_dmv_office_locations = [{:office_name=>"IRONDEQUOIT",
                                :office_type=>"COUNTY OFFICE",
                                :public_phone_number=>"5857531604",
                                :street_address_line_1=>"545 TITUS AVENUE",
                                :city=>"ROCHESTER",
                                :state=>"NY",
                                :zip_code=>"14617",
                                :monday_beginning_hours=>"8:30 AM",
                                :monday_ending_hours=>"4:30 PM",
                                :tuesday_beginning_hours=>"8:30 AM",
                                :tuesday_ending_hours=>"4:30 PM",
                                :wednesday_beginning_hours=>"8:30 AM",
                                :wednesday_ending_hours=>"6:30 PM",
                                :thursday_beginning_hours=>"8:30 AM",
                                :thursday_ending_hours=>"4:30 PM",
                                :friday_beginning_hours=>"8:30 AM",
                                :friday_ending_hours=>"4:30 PM",
                                :georeference=>{:type=>"Point", :coordinates=>[-77.601698077, 43.20982583]},
                                :":@computed_region_yamh_8v7k"=>"545",
                                :":@computed_region_wbg7_3whc"=>"1676",
                                :":@computed_region_kjdx_g34t"=>"2093"},
                              {:office_name=>"SARANAC LAKE",
                                :office_type=>"COUNTY OFFICE",
                                :public_phone_number=>"5188911748",
                                :street_address_line_1=>"39 MAIN STREET",
                                :street_address_line_2=>"SUITE 4",
                                :city=>"SARANAC LAKE",
                                :state=>"NY",
                                :zip_code=>"12983",
                                :tuesday_beginning_hours=>"9:00 AM",
                                :tuesday_ending_hours=>"2:00 PM",
                                :wednesday_beginning_hours=>"9:00 AM",
                                :wednesday_ending_hours=>"2:00 PM",
                                :thursday_beginning_hours=>"9:00 AM",
                                :thursday_ending_hours=>"2:00 PM",
                                :georeference=>{:type=>"Point", :coordinates=>[-74.132173627, 44.325366744]},
                                :":@computed_region_yamh_8v7k"=>"183",
                                :":@computed_region_wbg7_3whc"=>"303",
                                :":@computed_region_kjdx_g34t"=>"621"},
                              {:office_name=>"MOHAWK WELCOME CENTER KIOSK",
                                :office_type=>"DISTRICT OFFICE",
                                :street_address_line_1=>"I90 WESTBOUND MILEPOST187",
                                :street_address_line_2=>"MOHAWK VALLEY WELCOME CTR",
                                :city=>"FULTONVILLE",
                                :state=>"NY",
                                :zip_code=>"12072",
                                :tuesday_beginning_hours=>"24 HOURS",
                                :tuesday_ending_hours=>"24 HOURS",
                                :wednesday_beginning_hours=>"24 HOURS",
                                :wednesday_ending_hours=>"24 HOURS",
                                :thursday_beginning_hours=>"24 HOURS",
                                :thursday_ending_hours=>"24 HOURS",
                                :friday_beginning_hours=>"24 HOURS",
                                :friday_ending_hours=>"24 HOURS",
                                :georeference=>{:type=>"Point", :coordinates=>[-74.405485314, 42.938627401]},
                                :":@computed_region_yamh_8v7k"=>"492",
                                :":@computed_region_wbg7_3whc"=>"1221",
                                :":@computed_region_kjdx_g34t"=>"624"}]
    @mo_dmv_office_locations = [{:number=>"077",
                                :dorregionnumber=>"4",
                                :type=>"1MV",
                                :name=>"NEVADA",
                                :address1=>"409 E AUSTIN BLVD",
                                :city=>"NEVADA",
                                :state=>"MO",
                                :zipcode=>"64772",
                                :county=>"Vernon",
                                :phone=>"(417) 448-5705",
                                :fax=>"(417) 448-5912",
                                :size=>"2",
                                :email=>"NEVADAAGENTOFFICE@DOR.MO.GOV",
                                :agent=>"THE IRON VAULT, LLC",
                                :officemanager=>"ELIZABETH CASSIDY",
                                :daysopen=>"Monday - Friday - 8:00 to 5:00, Last Saturday of the Month  - 8:00 to 12:00",
                                :daysclosed=>"Monday - Friday from 1:00 to 1:30",
                                :holidaysclosed=>
                                "Christmas Day (12/25/23), New Year's Day (1/1/24), Martin Luther King Jr. Day (1/15/24), Lincoln's Birthday (2/12/24), President's Day (2/19/24), Truman's Birthday (5/8/24), Memorial Day (5/27/24), Juneteenth (6/19/24), Independence Day (7/4/24), Labor Day (9/2/24), Columbus Day (10/14/24), Veterans Day (11/11/24), Thanksgiving Day (11/28/24), Christmas Day (12/25/24)",
                                :additionaldaysclosed=>"3/6/2023 (at 3:45 PM ),    3/6/2023 (at 9:30 AM until 12:00 PM ),    3/6/2023 (open at 12:00 PM ),  7/1/2023,   7/3/2023,     11/24/23,        11/25/23, 11/29/2024, 12/24/2024, ",
                                :latlng=>{:latitude=>"37.837063", :longitude=>"-94.347818"},
                                :facebook_url=>"https://m.facebook.com/nevadalicenseoffice",
                                :additional_license_office_info=>"MOTOR VEHICLE PHONE IN RENEWAL - (417) 448-5705",
                                :":@computed_region_ny2h_ckbz"=>"313",
                                :":@computed_region_c8ar_jsdj"=>"73",
                                :":@computed_region_ikxf_gfzr"=>"2218"},
                              {:number=>"059",
                                :dorregionnumber=>"5",
                                :type=>"1MV",
                                :name=>"FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE",
                                :address1=>"10425 WEST FLORISSANT",
                                :city=>"FERGUSON",
                                :state=>"MO",
                                :zipcode=>"63136",
                                :located_in=>"Personalized plates can be picked up at the North County License Office. ",
                                :county=>"St. Louis County",
                                :phone=>"(314) 733-5316",
                                :fax=>"(314) 733-5319",
                                :size=>"3",
                                :email=>"FERGUSONAGENTOFFICE@DOR.MO.GOV",
                                :latlng=>{:latitude=>"38.737935", :longitude=>"-90.220029"},
                                :textingphonenumber=>"(314) 730-0606",
                                :additional_license_office_info=>"Personalized plates can be picked up at the North County License office located at 11700 W Florissant, St. Louis, MO 63033.",
                                :":@computed_region_ny2h_ckbz"=>"203",
                                :":@computed_region_c8ar_jsdj"=>"51",
                                :":@computed_region_ikxf_gfzr"=>"2210"}]
  end

  describe "#initialize" do
    it "exists" do
      expect(@factory).to be_a FacilityFactory
    end

    it "can initialize" do
      expect(@factory.facilities).to eq []
    end
  end

  describe "#create_facilities" do
    it "can create many facilities for CO" do
      facilities = @factory.create_facilities(@co_dmv_office_locations)

      expect(facilities.count).to be 2
    end
  end

    it "can create many facilities for NY" do
      facilities = @factory.create_facilities(@ny_dmv_office_locations)

      expect(facilities.count).to be 3
    end

    it "can create more than one facility for MO" do
      facilities = @factory.create_facilities(@mo_dmv_office_locations)

      expect(facilities.count).to be 2
    end

end