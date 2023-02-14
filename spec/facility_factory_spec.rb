require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    @missouri_facility_1 = {:number=>"153",
    :dorregionnumber=>"10",
    :type=>"1MV",
    :name=>"SAINTE GENEVIEVE ",
    :address1=>"753 STE. GENEVIEVE DR",
    :city=>"STE GENEVIEVE ",
    :state=>"MO",
    :zipcode=>"63670",
    :county=>"Ste. Genevieve",
    :phone=>"(573) 883-2344",
    :fax=>"(573) 880-5062",
    :size=>"1",
    :email=>"SAINTEGENEVIEVEAGENTOFFICE@DOR.MO.GOV",
    :agent=>"STE. GENEVIEVE CHAMBER OF COMMERCE",
    :officemanager=>"KARA GRASS",
    :daysopen=>"Monday - Friday - 8:30 to 5:00, Last 4 week days - 8:00 to 5:00",
    :holidaysclosed=>
     "Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)",
    :additionaldaysclosed=>
     "8/19/2022,     10/4/2022 (at 10:00 AM),     10/11/2022,     11/25/22,     11/26/22,     12/22/2022,     12/23/2022,    12/23/22,     12/24/22,    12/26/22,     12/27/2022 (open at 8:00 AM ),     12/31/2022,    1/25/2023,   1/30/2023 (at 8:00 AM until 11:00 AM ),   1/30/2023 (open at 11:00 AM ),     11/24/23,     12/22/23,     12/29/23",
    :latlng=>{:latitude=>"37.968058", :longitude=>"-90.049637"},
    :othercontactinfo=>"Website: www.stegenchamber.orgPublic E-Mail: sglicenseoffice@gmail.com",
    :":@computed_region_ny2h_ckbz"=>"303",
    :":@computed_region_c8ar_jsdj"=>"71",
    :":@computed_region_ikxf_gfzr"=>"2209"}
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_a FacilityFactory
    end
  end

  describe '#create_facilities' do
    before(:each) do
      @oregon = @factory.create_facilities(@oregon_facilities, :OR)
      @new_york = @factory.create_facilities(@new_york_facilities, :NY)
      @missouri = @factory.create_facilities(@missouri_facilities, :MO)
    end

    it 'can create multiple facility objects' do
      expect(@oregon).to be_a Array
      expect(@oregon.first).to be_a Facility
      expect(@oregon.last).to be_a Facility
      expect(@oregon.sample).to be_a Facility

      expect(@new_york).to be_a Array
      expect(@new_york.first).to be_a Facility
      expect(@new_york.last).to be_a Facility
      expect(@new_york.sample).to be_a Facility

      expect(@missouri).to be_a Array
      expect(@missouri.first).to be_a Facility
      expect(@missouri.last).to be_a Facility
      expect(@missouri.sample).to be_a Facility
    end

    it 'can create facility objects for all facilities in data set' do
      expect(@oregon.count).to eq(@oregon_facilities.count)
      expect(@new_york.count).to eq(@new_york_facilities.count)
      expect(@missouri.count).to eq(@missouri_facilities.count)
    end

    it 'can add attributes to the facility objects' do
      expect(@oregon.sample.name).to be_a String
      expect(@oregon.sample.address).to be_a String
      expect(@oregon.sample.phone).to be_a String
      expect(@oregon.sample.services).to eq([])
      expect(@oregon.sample.registered_vehicles).to eq([])
      expect(@oregon.sample.collected_fees).to eq(0)

      expect(@new_york.sample.name).to be_a String
      expect(@new_york.sample.address).to be_a String
      expect(@new_york.sample.phone).to be_a String
      expect(@new_york.sample.services).to eq([])
      expect(@new_york.sample.registered_vehicles).to eq([])
      expect(@new_york.sample.collected_fees).to eq(0)

      expect(@missouri.sample.name).to be_a String
      expect(@missouri.sample.address).to be_a String
      expect(@missouri.sample.phone).to be_a String
      expect(@missouri.sample.services).to eq([])
      expect(@missouri.sample.registered_vehicles).to eq([])
      expect(@missouri.sample.collected_fees).to eq(0)
    end
  end

  describe 'Oregon helper methods' do
    before(:each) do
      @oregon_facility_1 = {:title=>"Albany DMV Office",
                            :zip_code=>"97321",
                            :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx",
                            :type=>"DMV Location",
                            :phone_number=>"541-967-2014",
                            :agency=>"Transportation, Department of ",
                            :location_1=>{:latitude=>"44.632897",
                                          :longitude=>"-123.077928",
                                          :human_address=>"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}}
    end

    describe '#or_standardize_data' do
      it 'creates an array of hashes' do
        expect(@factory.or_standardize_data(@oregon_facilities)).to be_a Array
        expect(@factory.or_standardize_data(@oregon_facilities)[0]).to be_a Hash
      end

      it 'assigns attributes with the correct data' do
        expect(@factory.or_standardize_data(@oregon_facilities)[0][:name]).to eq(@oregon_facility_1[:title])
        expect(@factory.or_standardize_data(@oregon_facilities)[0][:phone]).to eq(@oregon_facility_1[:phone_number])
        expect(@factory.or_standardize_data(@oregon_facilities)[0][:address]).to eq(@factory.or_format_address(@oregon_facilities[0]))
      end
    end

    describe '#or_format_address' do
      it 'returns a single string with formatted address data' do
        expect(@factory.or_format_address(@oregon_facility_1)).to be_a String
        expect(@factory.or_format_address(@oregon_facility_1)).to eq("2242 Santiam Hwy SE Albany OR 97321")
      end
    end
  end

  describe 'New York helper methods' do
    before(:each) do
      @new_york_facility_1 = {:office_name=>"JAMESTOWN",
      :office_type=>"COUNTY OFFICE",
      :public_phone_number=>"7166618220",
      :street_address_line_1=>"512 WEST 3RD STREET",
      :city=>"JAMESTOWN",
      :state=>"NY",
      :zip_code=>"14701",
      :monday_beginning_hours=>"8:30 AM",
      :monday_ending_hours=>"4:15 PM",
      :tuesday_beginning_hours=>"8:30 AM",
      :tuesday_ending_hours=>"4:15 PM",
      :wednesday_beginning_hours=>"8:30 AM",
      :wednesday_ending_hours=>"4:15 PM",
      :thursday_beginning_hours=>"8:30 AM",
      :thursday_ending_hours=>"5:45 PM",
      :friday_beginning_hours=>"8:30 AM",
      :friday_ending_hours=>"4:15 PM",
      :georeference=>{:type=>"Point", :coordinates=>[-79.24796, 42.09526]},
      :":@computed_region_yamh_8v7k"=>"209",
      :":@computed_region_wbg7_3whc"=>"1687",
      :":@computed_region_kjdx_g34t"=>"2035"}
    end

    describe '#ny_standardize_data' do
      it 'creates an array of hashes' do
        expect(@factory.ny_standardize_data(@new_york_facilities)).to be_a Array
        expect(@factory.ny_standardize_data(@new_york_facilities)[0]).to be_a Hash
      end

      it 'assigns attributes with the correct data' do
        expect(@factory.ny_standardize_data(@new_york_facilities)[0][:name]).to eq(@factory.ny_format_name(@new_york_facilities[0]))
        expect(@factory.ny_standardize_data(@new_york_facilities)[0][:phone]).to eq(@factory.ny_format_phone(@new_york_facilities[0]))
        expect(@factory.ny_standardize_data(@new_york_facilities)[0][:address]).to eq(@factory.ny_format_address(@new_york_facilities[0]))
      end
    end

    describe '#ny_format_name' do
      it 'returns a single string with formatted name data' do
        expect(@factory.ny_format_name(@new_york_facility_1)).to be_a String
        expect(@factory.ny_format_name(@new_york_facility_1)).to eq("JAMESTOWN DMV Office")
      end
    end

    describe '#ny_format_address' do
      it 'returns a single string with formatted address data' do
        expect(@factory.ny_format_address(@new_york_facility_1)).to be_a String
        expect(@factory.ny_format_address(@new_york_facility_1)).to eq("512 WEST 3RD STREET JAMESTOWN NY 14701")
      end
    end

    describe '#ny_format_phone' do
      it 'returns a single string with a formatted phone number' do
        expect(@factory.ny_format_phone(@new_york_facility_1)).to be_a String
        expect(@factory.ny_format_phone(@new_york_facility_1)).to eq("716-661-8220")
      end
    end
  end
end
