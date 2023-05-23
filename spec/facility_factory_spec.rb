require "./spec/spec_helper"
require "./lib/facility_factory"


RSpec.describe FacilityFactory do

  let(:or_data_example) do
    [{"title":"Albany DMV Office","zip_code":"97321","website":"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx","type":"DMV Location","phone_number":"541-967-2014","agency":"Transportation, Department of ","location_1":{"latitude":"44.632897","longitude":"-123.077928","human_address":"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}}]
  end

  let(:ny_data_example) do
    [{"office_name":"JAMAICA KIOSK","office_type":"DISTRICT OFFICE","street_address_line_1":"168-46 91ST AVE., 2ND FLR","city":"JAMAICA","state":"NY","zip_code":"11432","monday_beginning_hours":"7:30 AM","monday_ending_hours":"5:00 PM","tuesday_beginning_hours":"7:30 AM","tuesday_ending_hours":"5:00 PM","wednesday_beginning_hours":"7:30 AM","wednesday_ending_hours":"5:00 PM","thursday_beginning_hours":"7:30 AM","thursday_ending_hours":"5:00 PM","friday_beginning_hours":"7:30 AM","friday_ending_hours":"5:00 PM","georeference":{"type":"Point","coordinates":[-73.79219,40.70742]},":@computed_region_yamh_8v7k":"196",":@computed_region_wbg7_3whc":"1216",":@computed_region_kjdx_g34t":"2137"}]
  end

  let(:mo_data_example) do
    [{"number":"166","dorregionnumber":"8","type":"1MV","name":"OAKVILLE","address1":"3164 TELEGRAPH ROAD","city":"ST LOUIS","state":"MO","zipcode":"63125","county":"St. Louis County","phone":"(314) 887-1050","fax":"(314) 887-1051","size":"3","email":"OAKVILLEAGENTOFFICE@DOR.MO.GOV","agent":"York Management Group, LLC.","officemanager":"Rita Lahr","daysopen":"Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00","holidaysclosed":"Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)","additionaldaysclosed":"7/2/22,     9/3/22,     11/25/22,     11/26/22,     11/28/2022 (at 11:45 AM),     12/22/2022 (at 1:30 PM ),     12/31/22,    1/25/2023 (at 9:00 AM until 11:00 AM ),    1/25/2023 (open at 11:00 AM ),   1/30/2023 (at 9:00 AM until 10:00 AM ),   1/30/2023 (open at 10:00 AM ),  2/22/2023 (at 3:00 PM ),     5/27/23,     9/2/23,     11/24/23,     11/25/23,     12/30/23","latlng":{"latitude":"38.4981572","longitude":"-90.3001675"},"facebook_url":"https://m.facebook.com/people/Oakville-License-Office/100069096876261/","textingphonenumber":"(314) 730-0606","othercontactinfo":"Public Email: oakville@yorkmanagementgroup.com",":@computed_region_ny2h_ckbz":"248",":@computed_region_c8ar_jsdj":"51",":@computed_region_ikxf_gfzr":"2210"}]
  end

  it "exists" do
    factory = FacilityFactory.new

    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  it "can create OR facilities with specific facility details" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(or_data_example)

    expect(facilities.first.name).to eq("Albany DMV Office")
    expect(facilities.first.address).to eq("2242 Santiam Hwy SE, Albany OR 97321")
    expect(facilities.first.phone).to eq("541-967-2014")
  end

  it "can create OR facilities with large datasets" do
    factory = FacilityFactory.new
    oregon_facilities = DmvDataService.new.or_dmv_office_locations
    facilities = factory.create_facilities(oregon_facilities)

    expect(facilities[1].name).to be_a(String)
    expect(facilities[1].address).to be_a(String)
    expect(facilities[1].phone).to be_a(String)
  end

  it "can create NY facilities with specific facility details" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(ny_data_example)

    expect(facilities.first.name).to eq("JAMAICA KIOSK")
    expect(facilities.first.address).to eq("168-46 91ST AVE., 2ND FLR, JAMAICA NY 11432")
    expect(facilities.first.phone).to eq(nil)
  end

    it "can create NY facilities with large datasets" do
    factory = FacilityFactory.new
    new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    facilities = factory.create_facilities(new_york_facilities)

    expect(facilities[1].name).to be_a(String)
    expect(facilities[1].address).to be_a(String)
    expect(facilities[1].phone).to be_a(String)
  end

  xit "can create MO facilities with specific facility details" do
    factory = FacilityFactory.new
    facilities = factory.create_facilities(mo_data_example)

    expect(facilities.first.name).to eq("Oakville")
    expect(facilities.first.address).to eq("3164 Telegraph Rd, St Louis MO 63125")
    expect(facilities.first.phone).to eq("314-887-1050")
  end

  xit "can create MO facilities with large datasets" do
    factory = FacilityFactory.new
    missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    facilities = factory.create_facilities(missouri_facilities)
  
    expect(facilities.first.name).to be_a(String)
    expect(facilities.first.address).to be_a(String)
    expect(facilities.first.phone).to be_a(String)
  end
end