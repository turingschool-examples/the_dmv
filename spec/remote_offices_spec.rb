require 'spec_helper'

RSpec.describe RemoteOffice do
  describe 'initialize' do
    it 'is an instance of remote office' do 
      offices = RemoteOffice.new

      expect(offices).to be_an_instance_of(RemoteOffice)
    end
  end

  describe 'oregon_offices' do
    it 'has oregon office info' do
      offices = RemoteOffice.new
      or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      office = offices.checks_location(or_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(59)
    end
  end

  describe 'ny_offices' do
    it 'has ny office info' do
      offices = RemoteOffice.new
      ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
      office = offices.checks_location(ny_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(169)
    end
  end

  describe 'mo_offices' do
    it 'has mo office info' do
      offices = RemoteOffice.new
      mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
      office = offices.checks_location(mo_dmv_office_locations)

      expect(office).to be_a(Array)
      expect(office.first).to be_a(Facility)
      expect(office.length).to eq(178)
    end
  end
end