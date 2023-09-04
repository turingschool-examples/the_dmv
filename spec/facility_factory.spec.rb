require 'spec_helper'

RSpec.describe Facility_Factory do
  describe '#CO_DMV facility data' do
    it 'creates "CO facilities' do
      facility = Facility_Factory.new
      colorado_facilities = DmvDataService.new.co_dmv_office_locations

    expect(facility.create_office_locations(colorado_facilities)[0]).to be_an_instance_of (Facility)
    facility.create_office_locations(colorado_facilities).each do |data|
      expect(data).to be_instance_of (Facility)
    end
    end
  end

  describe '#NY_DMV facility data' do
    it 'creates "NY facilities' do
      facility = Facility_Factory.new
      NY_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(facility.create_office_locations(NY_facilities)[0]).to be_an_instance_of (Facility)
    facility.create_office_locations(NY_facilities).each do |data|
      expect(data).to be_instance_of (Facility)
    end
    end
  end
end