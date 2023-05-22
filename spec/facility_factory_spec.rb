require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end
  describe '#initialize' do
        it 'can initialize' do
            factory = FacilityFactory.new
            expect(factory).to be_an_instance_of(Facility)
        end
    end
end