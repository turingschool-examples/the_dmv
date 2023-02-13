require 'spec_helper'

RSpec.describe DmvFacility do
  describe '#initialize' do 
    it 'exists' do
      location = DmvFacility.new

      expect(location).to be_an_instance_of(DmvFacility)
    end
  end

  describe '#create dmv facility' do
    it 'can create or dmv facility objects' do
      dmv_facility = DmvFacility.new
      or_facilities = DmvDataService.new.or_dmv_office_locations

      expect(or_facilities).to be_an_instance_of(Array)
      expect(or_facilities.size).to eq(59)
      expect(or_facilities.first).to be_an_instance_of(Hash)
      expect(dmv_facility.create_or_facilities(or_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.locations.size).to eq(59)
      expect(dmv_facility.locations.first).to be_an_instance_of(Facility)
      expect(dmv_facility.locations.last).to be_an_instance_of(Facility)
    end

    it 'can create ny dmv facility objects' do
      dmv_facility = DmvFacility.new
      ny_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(dmv_facility.create_ny_facilities(ny_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.locations.size).to eq(169)
      expect(dmv_facility.locations.first.address).to be_an_instance_of(String)
      expect(dmv_facility.locations.first.address.include?("NY")).to eq(true)
    end

    it 'can create mo dmv facility objects' do
      dmv_facility = DmvFacility.new
      mo_facilities = DmvDataService.new.mo_dmv_office_locations
      
      expect(dmv_facility.create_mo_facilities(mo_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.locations.first.address.include?("MO")).to eq(true)
      require 'pry'; binding.pry
    end
  end
end