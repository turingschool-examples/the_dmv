require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  before(:each) do
    @oregon = @factory.create_facilities(@oregon_facilities, :OR)
    @new_york = @factory.create_facilities(@new_york_facilities, :NY)
  end
 
  describe 'creates facilities' do
    it 'can create facility objects' do
      expect(@oregon).to be_an(Array)
      expect(@oregon.first).to be_a(Facility)
      expect(@new_york).to be_an(Array)
      expect(@new_york.first).to be_a(Facility)
    end
  end

  describe 'formats Oregon facility info' do
    it 'formats :OR facility name' do
      expect(@oregon.first.name).to eq("Albany DMV Office")
    end

    it 'formats :OR facility phone number' do
      expect(@oregon.first.phone).to eq("541-967-2014")
    end

    it 'formats :OR facility address' do
      expect(@oregon.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
    end
  end

  describe 'formats New York facility info' do
    it 'formats :NY facility name' do
      expect(@new_york.first.name).to eq("Selden DMV Office")
    end

    it 'formats :NY facility phone number' do
      expect(@new_york.first.phone).to eq(nil)
    end

    it 'formats :NY facility address' do
      expect(@new_york.first.address).to eq("407 SELDEN RD Selden NY 11784")
    end
  end
end