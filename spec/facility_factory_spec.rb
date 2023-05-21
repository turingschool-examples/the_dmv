require 'spec_helper'

RSpec.describe FacilityFactory do
  before(:each) do
  @oregon_facilities = DmvDataService.new.or_dmv_office_locations
  @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
  @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  @oregon = FacilityFactory.new
  end
  
  describe '#initialize' do
    xit 'can initialize' do
      expect(@oregon).to be_a FacilityFactory
    end
  end

  describe '#define_facilities' do
    xit 'can put the facilities of oregon into an array' do
      expect(@oregon.operating_facilities).to eq []
      @oregon.define_facilities(@oregon_facilities)
      expect(@oregon.operating_facilities).to include(Facility)
   
    end

    xit 'each instantiated facility is formatted properly' do
      expect(@facility_1.registered_vehicles).to eq []
    end
  end
end
