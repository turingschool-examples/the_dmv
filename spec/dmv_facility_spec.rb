require 'spec_helper'

RSpec.describe DmvFacility do 
  let(:co_dmv_office_locations) do [
    {:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
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
    :":@computed_region_nku6_53ud"=>"1444"}
    ]
  end

  it "creates facility objects from all data" do
    data_service = instance_double("DmvDataService")
  end
end