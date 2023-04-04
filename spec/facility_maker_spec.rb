require 'spec_helper'
RSpec.describe FacilityMaker do
  before(:each) do 
    @dmv = Dmv.new
    expect(@dmv).to be_an_instance_of(Dmv)
    @facility_maker = FacilityMaker.new
  end

  describe '#add facility from data' do
    it 'can add facilities from oregon data' do
      or_dmv = DmvDataService.new.or_dmv_office_locations
      @facility_maker.new_facility(or_dmv)
      @dmv.add_facility(@facility_maker.new_facility(or_dmv))
      @dmv.facilities
    end
    it 'can add facilities from missouri data' do
      mo_dmv = DmvDataService.new.mo_dmv_office_locations
      @facility_maker.new_facility(mo_dmv)
      @dmv.add_facility(@facility_maker.new_facility(mo_dmv))
      @dmv.facilities
    end

    it 'can make facilities from new york data' do
      ny_dmv = DmvDataService.new.ny_dmv_office_locations
      @facility_maker.new_facility(ny_dmv)
      @dmv.add_facility(@facility_maker.new_facility(ny_dmv))
      @dmv.facilities
    end
  end
end