require 'spec_helper'

RSpec.describe FacilityBuilder do
  before(:each) do
    @builder = FacilityBuilder.new
    @or_facilities = DmvDataService.new.or_dmv_office_locations
    @ny_facilities = DmvDataService.new.ny_dmv_office_locations
    @mo_facilities = DmvDataService.new.mo_dmv_office_locations
    @facility_data_array = []
  end

  describe '#initialize' do
    it 'can initialize a facility builder' do
      expect(@builder).to be_a(FacilityBuilder)
      expect(@builder.facilities).to eq([])
    end
  end

  describe '#build_facilities' do
    it 'can create an array of facility objects for Oregon' do
      @builder.build_facilities(@or_facilities)

      expect(@builder.facilities).to be_a(Array)
      expect(@builder.facilities.first).to be_a(Facility)
      expect(@builder.facilities.size).to eq(59)
    end

    it 'can create an array of facility objects for New York' do
      @builder.build_facilities(@ny_facilities)

      expect(@builder.facilities).to be_a(Array)
      expect(@builder.facilities.first).to be_a(Facility)
      expect(@builder.facilities.size).to eq(169)
    end

    it 'can create an array of facility objects for Missouri' do
      @builder.build_facilities(@mo_facilities)

      expect(@builder.facilities).to be_a(Array)
      expect(@builder.facilities.first).to be_a(Facility)
      expect(@builder.facilities.size).to eq(178)
    end
  end

  describe '#build_hash' do
    it 'can build array of hashes for Oregon' do
      expect(@builder.build_hash(@or_facilities, @facility_data_array)).to be_a Array
      expect(@builder.build_hash(@or_facilities, @facility_data_array)).to all(be_a Hash)
    end

    it 'can build array of hashes for New York' do
      expect(@builder.build_hash(@ny_facilities, @facility_data_array)).to be_a Array
      expect(@builder.build_hash(@ny_facilities, @facility_data_array)).to all(be_a Hash)
    end

    it 'can build array of hashes for Missouri' do
      expect(@builder.build_hash(@mo_facilities, @facility_data_array)).to be_a Array
      expect(@builder.build_hash(@mo_facilities, @facility_data_array)).to all(be_a Hash)
    end
  end
end
