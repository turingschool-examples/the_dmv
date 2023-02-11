require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
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
  end

end