require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize facility objects' do
      expect(@factory).to be_a(FacilityFactory)
    end

  end

  describe '#create Facilities' do
    it 'can create OR facility object' do
      expect(@factory.facilities).to eq([])
      
      @factory.create_facilities(@oregon_facilities)

      expect(@factory.determine_name(@oregon_facilities.first)).to eq("Albany DMV Office")
      expect(@factory.determine_phone(@oregon_facilities.first)).to eq("541-967-2014")
      expect(@factory.determine_address(@oregon_facilities.first)).to eq("2242 Santiam Hwy SE")
    end

    it 'can create NY facility object' do 
      @new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(@factory.facilities).to eq([])

      @factory.create_facilities(@new_york_facilities)

      expect(@factory.determine_name(@new_york_facilities.first)).to eq("SELDEN")
      expect(@factory.determine_phone(@new_york_facilities[1])).to eq("718--52-6-8546")
      expect(@factory.determine_address(@new_york_facilities.first)).to eq("407 SELDEN RD")
    end

    it 'can create MO facility object' do
      @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(@factory.facilities).to eq([])

      @factory.create_facilities(@missouri_facilities)
      
      expect(@factory.facilities.first).to be_a(Facility)
      expect(@factory.facilities.first.name).to eq("OAKVILLE")
      expect(@factory.facilities.first.address).to eq("3164 TELEGRAPH ROAD")
      expect(@factory.facilities.first.phone).to eq("314-887-1050")
    end
  end

end 