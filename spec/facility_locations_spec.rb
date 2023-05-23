require 'spec_helper'


locations = FacilityLocation.new

oregon = {"title":"Albany DMV Office","zip_code":"97321","website":"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx","type":"DMV Location","phone_number":"541-967-2014","agency":"Transportation, Department of ","location_1":{"latitude":"44.632897","longitude":"-123.077928","human_address":"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}}

new_york = {"office_name":"ROCHESTER DOWNTOWN","office_type":"COUNTY OFFICE","public_phone_number":"5857531604","street_address_line_1":"200 E. MAIN STREET","street_address_line_2":"STE. 101","city":"ROCHESTER","state":"NY","zip_code":"14604","monday_beginning_hours":"9:00 AM","monday_ending_hours":"5:00 PM","tuesday_beginning_hours":"9:00 AM","tuesday_ending_hours":"5:00 PM","wednesday_beginning_hours":"9:00 AM","wednesday_ending_hours":"5:00 PM","thursday_beginning_hours":"9:00 AM","thursday_ending_hours":"5:00 PM","friday_beginning_hours":"9:00 AM","friday_ending_hours":"5:00 PM","georeference":{"type":"Point","coordinates":[-77.60697,43.15701]},":@computed_region_yamh_8v7k":"537",":@computed_region_wbg7_3whc":"1662",":@computed_region_kjdx_g34t":"2093"}

missouri = {"name":"OAKVILLE","address1":"3164 TELEGRAPH ROAD","city":"ST LOUIS","state":"MO","zipcode":"63125","county":"St. Louis County","phone":"(314) 887-1050","fax":"(314) 887-1051","size":"3","email":"OAKVILLEAGENTOFFICE@DOR.MO.GOV"}

describe FacilityLocation do


  it 'parses address to string' do
    expect(locations.parsed_address(oregon)).to eq('2242 Santiam Hwy SE Albany OR 97321')
    expect(locations.parsed_address(new_york)).to eq('200 E. MAIN STREET STE. 101 ROCHESTER NY 14604')
    expect(locations.parsed_address(missouri)).to eq('3164 TELEGRAPH ROAD ST LOUIS MO 63125')
  end


  it 'formats data to hash' do
    oregon_formatted = [{name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014'}]
    new_york_formatted = [{:address=>'200 E. MAIN STREET STE. 101 ROCHESTER NY 14604', :name=>'ROCHESTER DOWNTOWN', :phone=>'5857531604'}]
    missouri_formatted = [{:name=>'OAKVILLE', :address=>'3164 TELEGRAPH ROAD ST LOUIS MO 63125', :phone=>'(314) 887-1050'}]

    expect(locations.formatted_location(oregon)).to eq(oregon_formatted)
    expect(locations.formatted_location(new_york)).to eq(new_york_formatted)
    expect(locations.formatted_location(missouri)).to eq(missouri_formatted)
  end


  it 'creates data form oregan api' do
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    or_dmv = locations.create_facility(or_dmv_office_locations)
    expect(or_dmv).to be_a(Array)
    expect(or_dmv.first).to be_a(Facility)
    expect(or_dmv.first.name).to eq('Albany DMV Office')
    expect(or_dmv.first.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
    expect(or_dmv.first.phone).to eq('541-967-2014')
  end

  it 'creates data form new york api' do
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    ny_dmv = locations.create_facility(ny_dmv_office_locations)
    expect(ny_dmv).to be_a(Array)
    expect(ny_dmv[1]).to be_a(Facility)
    expect(ny_dmv[1].name).to eq('ROCHESTER DOWNTOWN')
    expect(ny_dmv[1].address).to eq('200 E. MAIN STREET STE. 101 ROCHESTER NY 14604')
    expect(ny_dmv[1].phone).to eq('5857531604')
  end

  it 'creates data form missouri api' do
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    mo_dmv = locations.create_facility(mo_dmv_office_locations)
    expect(mo_dmv).to be_a(Array)
    expect(mo_dmv[2]).to be_a(Facility)
    expect(mo_dmv[2].name).to eq('BOONVILLE')
    expect(mo_dmv[2].address).to eq('520 RYAN STREET UNIT F BOONVILLE MO 65233')
    expect(mo_dmv[2].phone).to eq('(660) 882-7077')
  end
end