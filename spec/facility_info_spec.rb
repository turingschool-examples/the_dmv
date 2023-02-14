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
      expect(@facility_info.daily_hours[0]).to eq({:monday_beginning_hours=>"8:30 AM",
        :monday_ending_hours=>"4:15 PM",
        :tuesday_beginning_hours=>"8:30 AM",
        :tuesday_ending_hours=>"4:15 PM",
        :wednesday_beginning_hours=>"8:30 AM",
        :wednesday_ending_hours=>"4:15 PM",
        :thursday_beginning_hours=>"8:30 AM",
        :thursday_ending_hours=>"5:45 PM",
        :friday_beginning_hours=>"8:30 AM",
        :friday_ending_hours=>"4:15 PM"})
    end

    it 'returns days open key for MO facilities' do
      expect(@facility_info_2.daily_hours[0]).to be_an_instance_of String
      expect(@facility_info_2.daily_hours[0]).to eq('Monday - Friday - 8:30 to 5:00, Last 4 week days - 8:00 to 5:00')
    end
  end

  describe '#holidays_closed' do
    it 'returns holidays facility is closed' do
      expect(@facility_info_2.holidays_closed[0]).
      to eq("Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
    end
  end

  it 'returns error message for NY data' do
    expect(@facility_info.holidays_closed).to eq('Information not available.')
  end
end