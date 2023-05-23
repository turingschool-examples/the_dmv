require 'spec_helper'

RSpec.describe FacilityConstructor do
  before do
    @constructor = FacilityConstructor.new
    @or_office = {"title":"Albany DMV Office","zip_code":"97321","website":"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx","type":"DMV Location","phone_number":"541-967-2014","agency":"Transportation, Department of ","location_1":{"latitude":"44.632897","longitude":"-123.077928","human_address":"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}}
    @ny_office = {"office_name":"ROCHESTER DOWNTOWN","office_type":"COUNTY OFFICE","public_phone_number":"5857531604","street_address_line_1":"200 E. MAIN STREET","street_address_line_2":"STE. 101","city":"ROCHESTER","state":"NY","zip_code":"14604","monday_beginning_hours":"9:00 AM","monday_ending_hours":"5:00 PM","tuesday_beginning_hours":"9:00 AM","tuesday_ending_hours":"5:00 PM","wednesday_beginning_hours":"9:00 AM","wednesday_ending_hours":"5:00 PM","thursday_beginning_hours":"9:00 AM","thursday_ending_hours":"5:00 PM","friday_beginning_hours":"9:00 AM","friday_ending_hours":"5:00 PM","georeference":{"type":"Point","coordinates":[-77.60697,43.15701]},":@computed_region_yamh_8v7k":"537",":@computed_region_wbg7_3whc":"1662",":@computed_region_kjdx_g34t":"2093"}
    @mo_office = {"number":"059","dorregionnumber":"5","type":"1MV","name":"FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE","address1":"10425 WEST FLORISSANT","city":"FERGUSON","state":"MO","zipcode":"63136","located_in":"Personalized plates can be picked up at the North County License Office. ","county":"St. Louis County","phone":"(314) 733-5316","fax":"(314) 733-5319","size":"3","email":"FERGUSONAGENTOFFICE@DOR.MO.GOV","latlng":{"latitude":"38.737935","longitude":"-90.220029"},"textingphonenumber":"(314) 730-0606","additional_license_office_info":"Personalized plates can be picked up at the North County License office located at 11700 W Florissant, St. Louis, MO 63033.",":@computed_region_ny2h_ckbz":"203",":@computed_region_c8ar_jsdj":"51",":@computed_region_ikxf_gfzr":"2210"}
  end

  it 'exists' do
    expect(@constructor).to be_a(FacilityConstructor)
  end

  describe '#name' do
    it 'returns name of facility' do
      expect(@constructor.name(@or_office)).to eq("Albany DMV Office")
      expect(@constructor.name(@ny_office)).to eq("ROCHESTER DOWNTOWN")
      expect(@constructor.name(@mo_office)).to eq("FERGUSON-OFFICE CLOSED UNTIL FURTHER NOTICE")
    end
  end

  describe '#address' do
    it 'parses address data into one string' do
      expect(@constructor.address(@or_office)).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@constructor.address(@ny_office)).to eq("200 E. MAIN STREET STE. 101 ROCHESTER NY 14604")
      expect(@constructor.address(@mo_office)).to eq("10425 WEST FLORISSANT FERGUSON MO 63136")
    end
  end

  describe '#phone' do
    it 'returns phone number' do
      expect(@constructor.phone(@or_office)).to eq("541-967-2014")
      expect(@constructor.phone(@ny_office)).to eq("5857531604")
      expect(@constructor.phone(@mo_office)).to eq("(314) 733-5316")
    end
  end


  describe '#create facilities' do
    it 'generates facilities from Oregon data' do
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      or_facilities = @constructor.create_facilities(or_dmv_office_locations)
      expect(or_facilities).to be_a(Array)
      expect(or_facilities.first).to be_a(Facility)
      expect(or_facilities.first.name).to eq("Albany DMV Office")
      expect(or_facilities.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(or_facilities.first.phone).to eq("541-967-2014")
      expect(or_facilities.length).to eq(59)
      expect(or_facilities[3].address).to eq("3370 10th St Suite A Baker City OR 97814")
    end

    it 'generates facilities from New York data' do
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      ny_facilities = @constructor.create_facilities(ny_dmv_office_locations)
      expect(ny_facilities).to be_a(Array)
      expect(ny_facilities.first).to be_a(Facility)
      expect(ny_facilities.first.name).to eq("JAMAICA KIOSK")
      expect(ny_facilities.first.address).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
      expect(ny_facilities.first.phone).to eq(nil)
      expect(ny_facilities[1].phone).to eq("5857531604")
      expect(ny_facilities.length).to eq(172)
    end

    it 'generates facilities from Missouri data' do
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      mo_facilities = @constructor.create_facilities(mo_dmv_office_locations)
      expect(mo_facilities).to be_a(Array)
      expect(mo_facilities.first).to be_a(Facility)
      expect(mo_facilities.first.name).to eq("OAKVILLE")
      expect(mo_facilities.first.address).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
      expect(mo_facilities.first.phone).to eq("(314) 887-1050")
      expect(mo_facilities.length).to eq(178)
    end
  end
end