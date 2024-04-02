require 'spec_helper'

RSpec.configure do |config|
config.formatter = :documentation
end

RSpec.describe FacilityFactory do

  it "can initialize" do
    expect(facility_factory = FacilityFactory.new).to be_an_instance_of(FacilityFactory)
  end

  #DmvDataService.new.co_dmv_office_locations

  it 'can create a facility' do
    facility_factory = FacilityFactory.new
    office_locations = [{
      :the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
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
      :":@computed_region_nku6_53ud"=>"1444"
      }]
    
      offices = facility_factory.create_facilities(office_locations)
      expect(offices).to all be_an_instance_of(Facility)
      expect(offices[0].name).to eq('DMV Tremont Branch')
      expect(offices[0].address).to eq('2855 Tremont Place')
      #expect(offices[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(offices[0].phone).to eq('(720) 865-4600')
      expect(offices[0].services).to eq([])
  end 

  it 'can create facilities for CO' do
    facility_factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    expect(facility_factory.create_facilities(co_dmv_office_locations)).to all be_an_instance_of(Facility)
  end

  xit 'can create facilities for NY' do
    facility_factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    expect(facility_factory.create_facilities(co_dmv_office_locations)).to all be_an_instance_of(Facility)
  end

  xit 'can create facilities for MO' do
    facility_factory = FacilityFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    expect(facility_factory.create_facilities(co_dmv_office_locations)).to all be_an_instance_of(Facility)
  end

end


