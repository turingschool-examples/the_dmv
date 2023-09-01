require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#create_facilities' do
    it 'will create Facility objects using a location dataset' do
      @factory.create_facilities(@co_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end
    end

    it 'will create Facility objects using a different location dataset' do
      @factory.create_facilities(@ny_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end
    end

    it 'will create Facility objects using a another different location dataset' do
      @factory.create_facilities(@mo_dmv_office_locations).each do |location|
        expect(location).to be_an_instance_of(Facility)
      end
    end
  end
end