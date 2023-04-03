require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    # @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  end

  describe '#initialize' do
    it 'exists' do
      expect(@factory).to be_a(FacilityFactory)
    end
  end

  describe 'creates facilities' do
    it 'can create facility objects' do
      # @oregon = @factory.create_facilities(@oregon_facilities, :OR)
      @new_york = @factory.create_facilities(@new_york_facilities, :NY)
      
      # expect(@oregon).to be_an(Array)
      # expect(@oregon.first).to be_a(Facility)
      expect(@new_york).to be_an(Array)
      expect(@new_york.first).to be_a(Facility)
    end
  end
end