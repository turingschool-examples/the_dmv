require 'spec_helper'

RSpec.describe FacilityInfo do 
  before(:each) do
    @dds = DmvDataService.new.ny_dmv_office_locations
    @facility_info = FacilityInfo.new(@dds)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facility_info).to be_an_instance_of(FacilityInfo)
    end

    it 'has a source' do
      expect(@facility_info.source).to eq(@dds)
    end
  end

  describe '#daily_hours' do
    it 'lists hours facility is open' do
      expect(@facility_info.daily_hours[0]).to be_an_instance_of Hash
    end
  end


end