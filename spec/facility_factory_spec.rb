require 'spec_helper'

RSpec.describe FacilityFactory do
  it 'exists' do
    factory = FacilityFactory.new

    expect(factory).to be_an_instance_of(FacilityFactory)
  end

  describe 'address parsers' do
    it 'has OR address parser' do
      factory = FacilityFactory.new
      facility_details = {:location_1=>
      {:latitude=>"42.184549",
      :longitude=>"-122.671018",
      :human_address=>"{\"address\": \"600 Tolman Creek Rd\", \"city\": \"Ashland\", \"state\": \"OR\", \"zip\": \"97520\"}"}}
      
      expect(factory.or_address_parser(facility_details)).to eq("600 Tolman Creek Rd Ashland OR 97520")
    end

    it 'has NY address parser' do
      factory = FacilityFactory.new
      facility_details = {:street_address_line_1=>"168 91ST AVE.", :city=>"JAMAICA", :state=>"NY", :zip_code=>"11432"}
      
      parsed_data = factory.ny_address_parser(facility_details)
      expect(parsed_data).to be_a(String)
      expect(parsed_data).to eq("168 91st Ave. Jamaica NY 11432")
    end

    it 'has MO address parser' do
      factory = FacilityFactory.new
      facility_details = {:address1=>"10425 WEST FLORISSANT", :city=>"FERGUSON", :state=>"MO", :zipcode=>"63136"}
      
      parsed_data = factory.mo_address_parser(facility_details)
      expect(parsed_data).to be_a(String)
      expect(parsed_data).to eq("10425 West Florissant Ferguson MO 63136")
    end

    it 'can parse address based off state' do
      factory = FacilityFactory.new
      or_locations = DmvDataService.new.or_dmv_office_locations
      ny_locations = DmvDataService.new.ny_dmv_office_locations
      mo_locations = DmvDataService.new.mo_dmv_office_locations
      
      oregon = factory.address_parser(or_locations)
      new_york = factory.address_parser(ny_locations)
      missouri = factory.address_parser(mo_locations)

      expect(oregon[0]).to be_a(String)
      expect(new_york[0]).to be_a(String)
      expect(missouri[0]).to be_a(String)
    end
  end

  describe '#parse_data' do
    it 'can parse all OR data into name, address, phone format' do
      factory = FacilityFactory.new
      or_locations = DmvDataService.new.or_dmv_office_locations
      
      parsed = factory.parse_data(or_locations)
      
      expect(parsed).to be_a(Hash)
      expect(parsed.keys).to eq([:name, :address, :phone])
    end
    
    it 'can parse all NY data into name, address, phone format' do
      factory = FacilityFactory.new
      ny_locations = DmvDataService.new.ny_dmv_office_locations
     
      parsed = factory.parse_data(ny_locations)
      
      expect(parsed).to be_a(Hash)
      expect(parsed.keys).to eq([:name, :address, :phone])
    end

    it 'can parse all MO data into name, address, phone format' do
      factory = FacilityFactory.new
      mo_locations = DmvDataService.new.mo_dmv_office_locations
       
      parsed = factory.parse_data(mo_locations)
      
      expect(parsed).to be_a(Hash)
      expect(parsed.keys).to eq([:name, :address, :phone])
    end
  end

  it 'Can Titleize Strings' do
    factory = FacilityFactory.new
    string = "1234 west COLORADO blvd., denver, cOlOrAdO"
    expect(factory.titleize(string)).to eq('1234 West Colorado Blvd., Denver, Colorado')
  end
end