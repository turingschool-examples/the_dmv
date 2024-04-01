require 'spec_helper'

describe FacilityFactory do
    before do
        @facility_factory = FacilityFactory.new
        @co_sample =
            [{:dmv_id=>"1",
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
            :":@computed_region_nku6_53ud"=>"1444"}]
        @ny_sample =
          [{:office_name=>"JAMAICA",
          :office_type=>"DISTRICT OFFICE",
          :public_phone_number=>"7189666155",
          :street_address_line_1=>"168-46 91ST AVE., 2ND FLR",
          :city=>"JAMAICA",
          :state=>"NY",
          :zip_code=>"11432",
          :monday_beginning_hours=>"7:30 AM",
          :monday_ending_hours=>"5:00 PM",
          :tuesday_beginning_hours=>"7:30 AM",
          :tuesday_ending_hours=>"5:00 PM",
          :wednesday_beginning_hours=>"7:30 AM",
          :wednesday_ending_hours=>"5:00 PM",
          :thursday_beginning_hours=>"7:30 AM",
          :thursday_ending_hours=>"5:00 PM",
          :friday_beginning_hours=>"7:30 AM",
          :friday_ending_hours=>"5:00 PM",
          :georeference=>{:type=>"Point", :coordinates=>[-73.791443647, 40.707575521]},
          :":@computed_region_yamh_8v7k"=>"196",
          :":@computed_region_wbg7_3whc"=>"1216",
          :":@computed_region_kjdx_g34t"=>"2137"}]
        @mo_sample =
          [{:number=>"077",
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
          :daysopen=>
           "Monday - Friday - 8:00 to 5:00, Last Saturday of the Month  - 8:00 to 12:00",
          :daysclosed=>"Monday - Friday from 1:00 to 1:30",
          :holidaysclosed=>"Christmas Day (12/25/23), New Year's Day (1/1/24), Martin Luther King Jr. Day (1/15/24), Lincoln's Birthday (2/12/24), President's Day (2/19/24), Truman's Birthday (5/8/24), Memorial Day (5/27/24), Juneteenth (6/19/24), Independence Day (7/4/24), Labor Day (9/2/24), Columbus Day (10/14/24), Veterans Day (11/11/24),
            Thanksgiving Day (11/28/24), Christmas Day (12/25/24)",
          :additionaldaysclosed=>
           "3/6/2023 (at 3:45 PM ),    3/6/2023 (at 9:30 AM until 12:00 PM ),    3/6/202
          3 (open at 12:00 PM ),  7/1/2023,   7/3/2023,     11/24/23,        11/25/23, 11/
          29/2024, 12/24/2024, ",
          :latlng=>{:latitude=>"37.837063", :longitude=>"-94.347818"},
          :facebook_url=>"https://m.facebook.com/nevadalicenseoffice",
          :additional_license_office_info=>
           "MOTOR VEHICLE PHONE IN RENEWAL - (417) 448-5705",
          :":@computed_region_ny2h_ckbz"=>"313",
          :":@computed_region_c8ar_jsdj"=>"73",
          :":@computed_region_ikxf_gfzr"=>"2218"}]
    end

    it 'is an instance of FacilityFactory' do
       expect(@facility_factory).to be_a(FacilityFactory)
    end

    it 'creates CO facility objects from api data' do
       co_facility_locations = DmvDataService.new.co_dmv_office_locations
       co_facilities = @facility_factory.create_facilities(co_facility_locations)
       co_facility_1 = co_facilities.first

       expect(co_facilities).to be_an(Array)
       expect(co_facilities).to all be_a(Facility)
       expect(co_facility_1.name).to be_a(String)
       expect(co_facility_1.phone).to be_a(String)
       expect(co_facility_1.address).to be_a(String)
    end

    it 'formats CO data correctly' do
       formatted_facility = @facility_factory.create_facilities(@co_sample)

       expect(formatted_facility.first.name).to eq("DMV Tremont Branch")
       expect(formatted_facility.first.address).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
       expect(formatted_facility.first.phone).to eq("(720) 865-4600")
    end

    it 'creates NY facility objects from api data' do
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        ny_facilities = @facility_factory.create_facilities(new_york_facilities)
        ny_facility_1 = ny_facilities.first

        expect(ny_facilities).to be_an(Array)
        expect(ny_facilities).to all be_a(Facility)
        expect(ny_facility_1.name).to be_a(String)
        expect(ny_facility_1.phone).to be_a(String)
        expect(ny_facility_1.address).to be_a(String)
    end

    it "formats NY data correctly" do
        formatted_facility = @facility_factory.create_facilities(@ny_sample)
        expect(formatted_facility.first.name).to eq("JAMAICA")
        expect(formatted_facility.first.address).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
        expect(formatted_facility.first.phone).to eq("7189666155")
    end

    it 'creates MO facility objects from api data' do
        missouri_facilities = DmvDataService.new.mo_dmv_office_locations
        mo_facilities = @facility_factory.create_facilities(missouri_facilities)
        mo_facility_1 = mo_facilities.first

        expect(mo_facilities).to be_an(Array)
        expect(mo_facilities).to all be_a(Facility)
        expect(mo_facility_1.name).to be_a(String)
        expect(mo_facility_1.phone).to be_a(String)
        expect(mo_facility_1.address).to be_a(String)
    end

    it "formats MO data correctly" do
        formatted_facility = @facility_factory.create_facilities(@mo_sample)

        expect(formatted_facility.first.name).to eq("NEVADA")
        expect(formatted_facility.first.address).to eq("409 E AUSTIN BLVD NEVADA MO 64772")
        expect(formatted_facility.first.phone).to eq("(417) 448-5705")
    end
end
