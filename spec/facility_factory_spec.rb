require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end
  describe 'initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end
  
  describe '#create_facility' do
    it 'returns facilities from the factory' do

      expect(@factory.create_facilities(@co_dmv_office_locations)).to all be_a(Facility)
    end

    it 'can pull data from the ny state data source' do

      expect(@factory.create_facilities(@ny_dmv_office_locations)).to all be_a(Facility)
    end

    it 'can pull data from missouri data source' do

      expect(@factory.create_facilities(@ny_dmv_office_locations)).to all be_a(Facility)
    end

    it 'returns similarly formatted information' do
    
      expect(@factory.create_facilities(@co_dmv_office_locations)[0].address).to eq("2855 Tremont Place Suite 118  Denver CO 80205")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[1].address).to eq("200 OLD COUNTRY ROAD RIVERHEAD NY 11901")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[2].address).to eq("366 WEST 31ST STREET NEW YORK NY 10001")
      expect(@factory.create_facilities(@co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[3].phone).to eq("(518) 486-9786")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[4].phone).to eq("(518) 481-1606")
    end
  end
end