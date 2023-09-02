require 'spec_helper'

RSpec.describe FacilityConstructor do
  before(:each) do
    @constructor = FacilityConstructor.new
    @co_dmv_offices = DmvDataService.new.co_dmv_office_locations
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@constructor).to be_an_instance_of(FacilityConstructor)
    end
  end

  describe '#create_facilities' do
    it 'can create DMV facilities based on API data' do
      creation_log = @constructor.create_facilities(@co_dmv_offices)
      expect(creation_log).to be_an_instance_of(Array)
      creation_log.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
      end
    end

    it 'creates facilities with all data intact' do
      creation_log = @constructor.create_facilities(@co_dmv_offices)
      expect(creation_log).to be_an_instance_of(Array)
      creation_log.each do |facility|
        expect(facility.name).not_to eq(nil)
        expect(facility.address).not_to eq(nil)
        expect(facility.phone).not_to eq(nil)
        expect(facility.services).not_to eq([])
      end
    end

    it 'can create facilities with a different data set' do
      ny_dmv_offices = DmvDataService.new.ny_dmv_office_locations
      creation_log = @constructor.create_facilities(ny_dmv_offices)
      expect(creation_log).to be_an_instance_of(Array)
      creation_log.each do |facility|
        expect(facility).to be_an_instance_of(Facility)
        expect(facility.name).not_to eq(nil)
        expect(facility.address).not_to eq(nil)
        expect(facility.phone).not_to eq(nil)
        expect(facility.services).not_to eq([])
      end
    end
  end
end