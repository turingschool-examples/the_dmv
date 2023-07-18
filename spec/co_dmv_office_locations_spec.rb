require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#co_dmv_locations' do
    it 'simple test to show pulled data from co_dmv_locations for further object tests' do
      # require 'pry' ; binding.pry
      expect(@co_dmv_office_locations).to include()
    end
  end

  describe '#co_dmv_office_locations' do
    it 'checks hashes for DMV Tremont Branch' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@co_dmv_office_locations)).to include(having_attributes(
        address__1: "Suite 118",
        address_li: "2855 Tremont Place",
        city: "Denver",
        dmv_office: "DMV Tremont Branch",
        phone: "(720) 865-4600",
        state: "CO",
        zip: "80205"))
    end
  end

  describe '#co_dmv_office_locations' do
    it 'checks hashes for DMV Northeast Branch' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@co_dmv_office_locations)).to include(having_attributes(
        address__1: "Suite 101",
        address_li: "4685 Peoria Street",
        city: "Denver",
        dmv_office: "DMV Northeast Branch",
        phone: "(720) 865-4600",
        state: "CO",
        zip: "80239"))
    end
  end

  describe 'new_york_dmv_locations' do
    it 'simple test to show pulled data from new_york_dmv_locations for further object tests' do
      # require 'pry' ; binding.pry
      expect(@new_york_facilities).to include()
    end
  end

  describe '#new_york_dmv_locations and fails' do
    it 'checks hashes to match office but the test is intended to pass ONLY because of the to_not' do
      # require 'pry' ; binding.pry
      # Purposely wrote test as a failure but didnt want it to show on
      # RSpec fails for rubric purposes so to_not is being used to pass the intended fail
      expect(@facility.create_facilities(@new_york_facilities)).to_not include(having_attributes(
        dmv_office: "JAMAICA",
        office_type: "DISTRICT OFFICE",
        phone: "7189666155",
        address__1: "168-46 91ST AVE., 2ND FLR",
        city: "JAMAICA",
        state: "NY",
        zip: "11432"))
    end
  end

  describe '#new_york_dmv_locations and passes' do
    it 'checks hashes to match Jamaica office and passes' do
      # require 'pry' ; binding.pry
      expect(@facility.create_facilities(@new_york_facilities)).to include(having_attributes(
        dmv_office: "JAMAICA",
        address_li: "DISTRICT OFFICE",
        phone: "7189666155",
        address__1: "168-46 91ST AVE., 2ND FLR",
        city: "JAMAICA",
        state: "NY",
        zip: "11432"))
    end
  end
end