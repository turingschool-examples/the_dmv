require 'spec_helper'

RSpec.describe FacilityFactory do
  it 'creates facility objects' do
    or_facilities = DmvDataService.new.or_dmv_office_locations
    factory = FacilityFactory.new
    facilities = factory.create_facilities(or_facilities)
    expect(facilities).to be_a(Array)
    facilities.map do |facility|
      expect(facility).to be_an_instance_of(Facility)
    end
  end
end