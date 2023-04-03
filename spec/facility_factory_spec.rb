require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    # @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  describe 'creates facilities' do
    it 'can create facility objects' do
      @factory.create_facilities(@oregon_facilities)
      # @factory.create_facilities(@new_york_facilities)

      expect(@factory.create_facilities(@oregon_facilities)).to be_an(Array)
      expect(@factory.create_facilities(@oregon_facilities).first).to be_a(Facility)
      # expect(@factory.create_facilities(@new_york_facilities)).to be_an(Array)
      # expect(@factory.create_facilities(@new_york_facilities).first).to be_an(Facility)
    end
  end
end