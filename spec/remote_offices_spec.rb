require 'spec_helper'

RSpec.describe RemoteOffice do
  describe 'initialize' do
    it 'is an instance of remote office' do 
      offices = RemoteOffice.new

      expect(offices).to be_an_instance_of(RemoteOffice)
    end
  end

  describe 'oregon_offices' do
    it 'has office info' do
      offices = RemoteOffice.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      office = offices.other_office_locations(or_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(59)
    end
  end
end