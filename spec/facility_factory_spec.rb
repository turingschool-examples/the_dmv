require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize facility objects' do
      expect(@factory).to be_a(FacilityFactory)
    end

  end




end