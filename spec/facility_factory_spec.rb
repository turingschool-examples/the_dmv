require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end
  describe 'initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end
  
  describe '#create_facility' do
    it 'returns facilities from the factory' do

      expect(@factory.create_facilities(@co_dmv_office_locations)).to all be_a(Facility)
    end

    it 'can pull data from the ny state data source' do

      expect(@factory.create_facilities(@ny_dmv_office_locations)).to all be_a(Facility)
    end

    it 'can pull data from missouri data source' do

      expect(@factory.create_facilities(@mo_dmv_office_locations)).to all be_a(Facility)
    end

    it 'returns similarly formatted information' do
    
      expect(@factory.create_facilities(@co_dmv_office_locations)[0].address).to eq("2855 Tremont Place Suite 118  Denver CO 80205")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[1].address).to eq("200 OLD COUNTRY ROAD RIVERHEAD NY 11901")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[2].address).to eq("366 WEST 31ST STREET NEW YORK NY 10001")
      expect(@factory.create_facilities(@co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[3].phone).to eq("(518) 486-9786")
      expect(@factory.create_facilities(@ny_dmv_office_locations)[4].phone).to eq("(518) 481-1606")
    end

   it 'returns daily hours' do

      expect(@factory.create_facilities(@ny_dmv_office_locations)[0].daily_hours).to eq("Monday 7:30 AM to 5:00 PM, Tuesday 7:30 AM to 5:00 PM, Wednesday 7:30 AM to 5:00 PM, Thursday 7:30 AM to 5:00 PM, Friday 7:30 AM to 5:00 PM")
    end

    it 'returns holidays closed when provided' do

      expect(@factory.create_facilities(@co_dmv_office_locations)[0].holidays_closed).to eq(nil)
      expect(@factory.create_facilities(@ny_dmv_office_locations)[0].holidays_closed).to eq(nil)
      expect(@factory.create_facilities(@mo_dmv_office_locations)[0].holidays_closed).to eq("Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)")
    end
  end
end