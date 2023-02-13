require 'spec_helper'

RSpec.describe DmvFacility do
  describe '#initialize' do 
    it 'exists' do
      location = DmvFacility.new

      expect(location).to be_an_instance_of(DmvFacility)
    end
  end

  describe 'create dmv facility' do
    it 'can creat dmv facility objects' do
      dmv_facility = DmvFacility.new
      or_facilities = DmvDataService.new.or_dmv_office_locations
     #dmv_facility.create_facilities(or_facilities)
# require 'pry'; binding.pry
      expect(or_facilities).to be_an_instance_of(Array)
      expect(or_facilities.size).to eq(59)
      expect(or_facilities.first).to be_an_instance_of(Hash)
      expect(dmv_facility.create_facilities(or_facilities)).to be_an_instance_of(Array)
    end
  end
end