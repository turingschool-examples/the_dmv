require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    it 'creates facilities from given source' do
      expect(@factory.create_facilities(@or_dmv_office_locations)).to be_an_instance_of(Array)
      expect(@factory.create_facilities(@or_dmv_office_locations)[0]).to be_an_instance_of(Facility)
      # running function twice...take out?
    end
    it 'can create multiple facilities' do
      expect(@factory.create_facilities(@new_york_facilities)).to be_an_instance_of(Array)
      expect(@factory.create_facilities(@new_york_facilities)[0]).to be_an_instance_of(Facility)

      # expect(@factory.create_facilities(@missouri_facilities)).to be_an_instance_of(Array)
      # expect(@factory.create_facilities(@missouri_facilities)[0]).to be_an_instance_of(Facility)
    end
  end

  describe '#extract_address' do
    it 'turns address from external data into string for create_facilities' do
      expect(@factory.extract_address({:title=>"Albany DMV Office",
      :zip_code=>"97321",
      :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx",
      :type=>"DMV Location",
      :phone_number=>"541-967-2014",
      :agency=>"Transportation, Department of ",
      :location_1=>{:latitude=>"44.632897", :longitude=>"-123.077928", :human_address=>
      "{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}})).
      to eq("2242 Santiam Hwy SE Albany OR 97321")
    end
  end

end