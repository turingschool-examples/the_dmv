require 'spec_helper'

RSpec.describe DmvFacility do
  before(:each) do
    @oregon_facilities = DmvFacility.new
    @or_dmv_office_locations ||= load_data('https://data.oregon.gov/resource/rj4w-f4jc.json')
  end

  describe 'exist' do
    it 'can exist' do
      expect(@oregon_facilities).to be_a(DmvFacility)
    end
  end

  describe '#create_facility(locations)' do
    it 'can create facility locations' do
      @oregon_facilities.create_facility(@or_dmv_office_locations)
      expect(@oregon_facilities.create_facility(@or_dmv_office_locations)).to be_an(Array)
      expect(@oregon_facilities.create_facility(@or_dmv_office_locations)[0]).to be_a(Facility)
      expect(@oregon_facilities.create_facility(@or_dmv_office_locations)[0]).to be_a(Hash)
    end
  end
end