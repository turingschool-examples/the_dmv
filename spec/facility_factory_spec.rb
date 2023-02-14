require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
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

    it "returns an error when a state is not valid" do
      expect(@factory.create_facilities(@oregon_facilities, :TX)).to eq("Sorry, this state is not yet supported.")
    end
  end

  describe 'Missouri helper methods' do
    before(:each) do
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
                              :fax=>"(573) 880-5062"}
    end

    describe '#mo_standardize_data' do
      it 'creates an array of hashes' do
        expect(@factory.mo_standardize_data(@missouri_facilities)).to be_a Array
        expect(@factory.mo_standardize_data(@missouri_facilities)[0]).to be_a Hash
      end

      it 'assigns attributes with the correct data' do
        expect(@factory.mo_standardize_data(@missouri_facilities)[0][:name]).to eq(@factory.mo_format_name(@missouri_facilities[0]))
        expect(@factory.mo_standardize_data(@missouri_facilities)[0][:phone]).to eq(@factory.mo_format_phone(@missouri_facilities[0]))
        expect(@factory.mo_standardize_data(@missouri_facilities)[0][:address]).to eq(@factory.mo_format_address(@missouri_facilities[0]))
      end
    end

    describe '#mo_format_name' do
      it 'returns a single string with formatted name data' do
        expect(@factory.mo_format_name(@missouri_facility_1)).to be_a String
        expect(@factory.mo_format_name(@missouri_facility_1)).to eq("SAINTE GENEVIEVE DMV Office")
      end
    end

    describe '#mo_format_address' do
      it 'returns a single string with formatted address data' do
        expect(@factory.mo_format_address(@missouri_facility_1)).to be_a String
        expect(@factory.mo_format_address(@missouri_facility_1)).to eq("753 STE. GENEVIEVE DR STE GENEVIEVE MO 63670")
      end
    end

    describe '#mo_format_phone' do
      it 'returns a single string with a formatted phone number' do
        expect(@factory.mo_format_phone(@missouri_facility_1)).to be_a String
        expect(@factory.mo_format_phone(@missouri_facility_1)).to eq("573-883-2344")
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
                                :friday_ending_hours=>"4:15 PM"}
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
end
