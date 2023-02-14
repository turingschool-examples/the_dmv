require 'spec_helper'

RSpec.describe FacilityInfo do 
  before(:each) do
    @dds = DmvDataService.new.ny_dmv_office_locations
    @dds_mo = DmvDataService.new.mo_dmv_office_locations
    @facility_info = FacilityInfo.new(@dds)
    @facility_info_2 = FacilityInfo.new(@dds_mo)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@facility_info).to be_an_instance_of(FacilityInfo)
      expect(@facility_info_2).to be_an_instance_of(FacilityInfo)
    end

    it 'has a source' do
      expect(@facility_info.source).to eq(@dds)
      expect(@facility_info_2.source).to eq(@dds_mo)
    end
  end

  describe '#daily_hours' do
    it 'lists hours NY facility is open' do
      expect(@facility_info.daily_hours[0]).to be_an_instance_of Hash
    end

    it 'returns days open key for MO facilities' do
      expect(@facility_info_2.daily_hours).to be_an_instance_of String
    end
  end
end