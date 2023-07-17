require 'spec_helper'

RSpec.describe FacilityFactory do 
  before(:each) do 
    @facility_factory = FacilityFactory.new
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations

  end

  describe '#initialize' do 
    it 'can initialize' do 
      expect(@facility_factory).to be_a(FacilityFactory)
    end
  end

  describe '#create facilities' do 
    it 'can create facility objects' do 
      # ny_facilities = @facility_factory.create_ny_facilities(@new_york_facilities)
      # expect(ny_facilities).to be_a(Facility)

      # mo_facilities = @facility_factory.create_mo_facilities(@missouri_facilities)
      # expect(mo_facilities).to be_a(Facility)
    end
  end
end