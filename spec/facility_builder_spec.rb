require 'spec_helper'

RSpec.describe FacilityBuilder do
  before(:each) do
    @builder = FacilityBuilder.new
  end

  describe '#initialize' do
    it 'can initialize a facility builder' do
      expect(@builder).to be_a(FacilityBuilder)
      expect(@builder.facilities).to eq([])
    end
  end

  describe '#build_facilities' do
    it 'can create an array of facility objects' do
      or_facilities = DmvDataService.new.or_dmv_office_locations
      @builder.build_facilities(or_facilities)

      expect(@builder.facilities).to be_a(Array)
      expect(@builder.facilities.first).to be_a(Facility)
      expect(@builder.facilities.size).to eq(59)
    end
  end
end
