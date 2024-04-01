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

    it 'formats the data correctly' do
       formatted_facility = @facility_factory.create_facilities(@co_sample)

       expect(formatted_facility.first.name).to eq("DMV Tremont Branch")
       expect(formatted_facility.first.address).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
       expect(formatted_facility.first.phone).to eq("(720) 865-4600")
    end

    it 'creates NY facility objects from api data' do
        new_york_facilities = DmvDataService.new.ny_dmv_office_locations
        ny_facilities = @facility_factory.create_facilities(new_york_facilities)
        ny_facility_1 = ny_facilities.first

        expect(ny_facilities_facilities).to be_an(Array)
        expect(ny_facilities).to all be_a(Facility)
        expect(ny_facility_1.name).to be_a(String)
        expect(ny_facility_1.phone).to be_a(String)
        expect(ny_facility_1.address).to be_a(String)
    end

    it "formats NY data correctly" do

    end
end
