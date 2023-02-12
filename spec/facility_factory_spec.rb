require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_an_instance_of(FacilityFactory)
    end
  end

  describe '#create_facilities' do
    it 'creates facilities from given source' do
      expect(@factory.create_facilities(@or_dmv_office_locations)).to be_an_instance_of(Array)
      expect(@factory.create_facilities(@or_dmv_office_locations)[0]).to be_an_instance_of(Facility)
      # running function twice...take out?
    end
    it 'can create multiple facilities' do
      expect(@factory.create_facilities(@new_york_facilities)).to be_an_instance_of(Array)
      expect(@factory.create_facilities(@new_york_facilities)[0]).to be_an_instance_of(Facility)

      # expect(@factory.create_facilities(@missouri_facilities)).to be_an_instance_of(Array)
      # expect(@factory.create_facilities(@missouri_facilities)[0]).to be_an_instance_of(Facility)
    end
  end

  describe 'create_or_facility' do
    it 'creates facilities from oregon database' do
      expect(@factory.create_or_facility(@or_dmv_office_locations)).to be_an_instance_of(Array)
      expect(@factory.create_or_facility(@or_dmv_office_locations)[0]).to be_an_instance_of(Facility)
    end
  end

  describe 'create_ny_facility' do
    it 'creates facilities from new york database' do
      expect(@factory.create_or_facility(@or_dmv_office_locations)).to be_an_instance_of(Array)
      expect(@factory.create_or_facility(@or_dmv_office_locations)[0]).to be_an_instance_of(Facility)
    end
  end

end