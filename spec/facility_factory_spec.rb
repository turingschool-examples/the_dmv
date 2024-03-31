require 'spec_helper'

RSpec.describe FacilityFactory do
  describe 'initialize' do
    it "can initialize" do
      facility_factory = FacilityFactory.new

      expect(facility_factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe 'create_facilities' do
    it "can create facilities from facility data" do
      facility_factory = FacilityFactory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations
      facility_data = [{:the_geom=>{:type=>"Point", :coordinates=>[-105.04992605145736, 39.655588304878336]}, :dmv_id=>"4", :dmv_office=>"DMV Southwest Branch", :address_li=>"3100 S. Sheridan Blvd.", :location=>"Bear Valley Shopping Center", :city=>"Denver", :state=>"CO", :zip=>"80227", :phone=>"(720) 865-4600", :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.", :services_p=>"vehicle titles, registration, renewals;  VIN inspections", :parking_no=>"parking in front of the building", :photo=>"images/Sheridan.jpg", :address_id=>"175532", :":@computed_region_nku6_53ud"=>"1444"}]
      facility_1 = facility_factory.create_facilities(facility_data)

      expect(facility_1[0].name).to eq("DMV Southwest Branch")
      expect(facility_1[0].address).to eq("3100 S. Sheridan Blvd. Denver CO 80227")
      expect(facility_1[0].phone).to eq("(720) 865-4600")
      expect(facility_1[0].services).to eq(["Vehicle Registration"])
      expect(facility_1[0].registered_vehicles).to eq([])
      expect(facility_1[0].collected_fees).to eq(0)
      expect(facility_1[0]).to be_an_instance_of(Facility)
      expect(facility_factory.create_facilities(colorado_facilities)).to all(be_a(Facility))
    end
  end
end

