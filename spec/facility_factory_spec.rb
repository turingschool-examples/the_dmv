require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'initialize' do
    it "can initialize" do
      facility_factory = FacilityFactory.new

      expect(facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe 'create_facilities' do
    it "can create facilities from co facility data" do
      facility_factory = FacilityFactory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      co_facility_data = [{:the_geom=>{:type=>"Point", :coordinates=>[-105.04992605145736, 39.655588304878336]}, :dmv_id=>"4", :dmv_office=>"DMV Southwest Branch", :address_li=>"3100 S. Sheridan Blvd.", :location=>"Bear Valley Shopping Center", :city=>"Denver", :state=>"CO", :zip=>"80227", :phone=>"(720) 865-4600", :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.", :services_p=>"vehicle titles, registration, renewals;  VIN inspections", :parking_no=>"parking in front of the building", :photo=>"images/Sheridan.jpg", :address_id=>"175532", :":@computed_region_nku6_53ud"=>"1444"}]
      facility_1 = facility_factory.create_facilities(co_facility_data)

      expect(facility_1[0].name).to eq("DMV Southwest Branch")
      expect(facility_1[0].address).to eq("3100 S. Sheridan Blvd. Denver CO 80227")
      expect(facility_1[0].phone).to eq("(720) 865-4600")
      expect(facility_1[0].services).to eq(["Vehicle Registration"])
      expect(facility_1[0].registered_vehicles).to eq([])
      expect(facility_1[0].collected_fees).to eq(0)
      expect(facility_1[0]).to be_an_instance_of(Facility)
      expect(facility_factory.create_facilities(colorado_facilities)).to all(be_a(Facility))
    end
  
    it "can create facilities from ny facility data" do
      facility_factory = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      ny_facility_data = [{:office_name=>"RIVERHEAD KIOSK", :office_type=>"DISTRICT OFFICE", :street_address_line_1=>"200 OLD COUNTRY ROAD", :city=>"RIVERHEAD", :state=>"NY", :zip_code=>"11901", :monday_beginning_hours=>"7:30 AM", :monday_ending_hours=>"5:00 PM", :tuesday_beginning_hours=>"7:30 AM", :tuesday_ending_hours=>"5:00 PM", :wednesday_beginning_hours=>"7:30 AM", :wednesday_ending_hours=>"5:00 PM", :thursday_beginning_hours=>"7:30 AM", :thursday_ending_hours=>"5:00 PM", :friday_beginning_hours=>"7:30 AM", :friday_ending_hours=>"5:00 PM", :georeference=>{:type=>"Point", :coordinates=>[-72.651333405, 40.937278602]}, :":@computed_region_yamh_8v7k"=>"1017", :":@computed_region_wbg7_3whc"=>"1530", :":@computed_region_kjdx_g34t"=>"2179"}]
      facility_2 = facility_factory.create_facilities(ny_facility_data)

      expect(facility_2[0].name).to eq("RIVERHEAD KIOSK")
      expect(facility_2[0].address).to eq("200 OLD COUNTRY ROAD RIVERHEAD NY 11901")
      expect(facility_2[0].phone).to eq(nil)
      expect(facility_2[0].services).to eq([])
      expect(facility_2[0].registered_vehicles).to eq([])
      expect(facility_2[0].collected_fees).to eq(0)
      expect(facility_2[0]).to be_an_instance_of(Facility)
      expect(facility_factory.create_facilities(new_york_facilities)).to all(be_a(Facility))
    end

    it "can create facilities from mo facility data" do
      facility_factory = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      mo_facility_data = [{:number=>"077", :dorregionnumber=>"4", :type=>"1MV", :name=>"NEVADA", :address1=>"409 E AUSTIN BLVD", :city=>"NEVADA", :state=>"MO", :zipcode=>"64772", :county=>"Vernon", :phone=>"(417) 448-5705", :fax=>"(417) 448-5912", :size=>"2", :email=>"NEVADAAGENTOFFICE@DOR.MO.GOV", :agent=>"THE IRON VAULT, LLC", :officemanager=>"ELIZABETH CASSIDY", :daysopen=>"Monday - Friday - 8:00 to 5:00, Last Saturday of the Month  - 8:00 to 12:00", :daysclosed=>"Monday - Friday from 1:00 to 1:30", :holidaysclosed=>"Christmas Day (12/25/23), New Year's Day (1/1/24), Martin Luther King Jr. Day (1/15/24), Lincoln's Birthday (2/12/24), President's Day (2/19/24), Truman's Birthday (5/8/24), Memorial Day (5/27/24), Juneteenth (6/19/24), Independence Day (7/4/24), Labor Day (9/2/24), Columbus Day (10/14/24), Veterans Day (11/11/24), Thanksgiving Day (11/28/24), Christmas Day (12/25/24)", :additionaldaysclosed=>  "3/6/2023 (at 3:45 PM ),    3/6/2023 (at 9:30 AM until 12:00 PM ),    3/6/2023 (open at 12:00 PM ),  7/1/2023,   7/3/2023,     11/24/23,        11/25/23, 11/29/2024, 12/24/2024, ", :latlng=>{:latitude=>"37.837063", :longitude=>"-94.347818"}, :facebook_url=>"https://m.facebook.com/nevadalicenseoffice", :additional_license_office_info=>"MOTOR VEHICLE PHONE IN RENEWAL - (417) 448-5705", :":@computed_region_ny2h_ckbz"=>"313", :":@computed_region_c8ar_jsdj"=>"73", :":@computed_region_ikxf_gfzr"=>"2218"}]

      facility_3 = facility_factory.create_facilities(mo_facility_data)

      expect(facility_3[0].name).to eq("NEVADA")
      expect(facility_3[0].address).to eq("409 E AUSTIN BLVD NEVADA MO 64772")
      expect(facility_3[0].phone).to eq("(417) 448-5705")
      expect(facility_3[0].services).to eq([])
      expect(facility_3[0].registered_vehicles).to eq([])
      expect(facility_3[0].collected_fees).to eq(0)
      expect(facility_3[0]).to be_an_instance_of(Facility)
      expect(facility_factory.create_facilities(missouri_facilities)).to all(be_a(Facility))
    end
  end
end