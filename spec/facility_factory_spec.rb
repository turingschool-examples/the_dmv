require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  before(:each) do
    @oregon = @factory.create_facilities(@oregon_facilities, :OR)
    @new_york = @factory.create_facilities(@new_york_facilities, :NY)
    @missouri = @factory.create_facilities(@missouri_facilities, :MO)
  end
 
  describe 'creates facilities' do
    it 'can create facility objects' do
      expect(@oregon).to be_an(Array)
      expect(@oregon.first).to be_a(Facility)
      expect(@oregon.sample).to be_a(Facility)
      expect(@new_york).to be_an(Array)
      expect(@new_york.first).to be_a(Facility)
      expect(@new_york.sample).to be_a(Facility)
      expect(@missouri).to be_an(Array)
      expect(@missouri.first).to be_a(Facility)
      expect(@missouri.sample).to be_a(Facility)
    end
  end

  describe '#oregon processing' do
    it 'formats :OR facility name' do
      expect(@oregon.first.name).to eq("Albany DMV Office")
      expect(@oregon.sample.name).to be_a(String)
    end

    it 'formats :OR facility phone number' do
      expect(@oregon.first.phone).to eq("541-967-2014")
      expect(@oregon.sample.phone).to be_a(String)
    end

    it 'formats :OR facility address' do
      expect(@oregon.first.address).to eq("2242 Santiam Hwy SE Albany OR 97321")
      expect(@oregon.sample.address).to be_a(String)
    end
  end

  describe '#new york processing' do
    it 'formats :NY facility name' do
      expect(@new_york.first.name).to eq("Selden DMV Office")
    end

    it 'formats :NY facility phone number' do
      expect(@new_york.first.phone).to eq(nil)
    end

    it 'formats :NY facility address' do
      expect(@new_york.first.address).to eq("407 SELDEN RD SELDEN NY 11784")
    end
  end

  describe '#missouri processing' do
    it 'formats :MO facility name' do
      expect(@missouri.first.name).to eq("Oakville DMV Office")
    end
    
    it 'formats :MO facility address' do
      expect(@missouri.first.address).to eq("3164 TELEGRAPH ROAD ST LOUIS MO 63125")
    end

    it 'formats :MO facility phone number' do
      expect(@missouri.first.phone).to eq("314-887-1050")
    end
  end
end