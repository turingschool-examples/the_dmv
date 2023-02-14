require 'spec_helper'

RSpec.describe DmvFacility do
  describe '#initialize' do 
    it 'exists' do
      location = DmvFacility.new

      expect(location).to be_an_instance_of(DmvFacility)
    end
  end

  describe '#create dmv facility by state' do
    it 'can create or dmv facility objects' do
      dmv_facility = DmvFacility.new
      or_facilities = DmvDataService.new.or_dmv_office_locations

      expect(or_facilities).to be_an_instance_of(Array)
      expect(or_facilities.size).to eq(59)
      expect(or_facilities.first).to be_an_instance_of(Hash)
      expect(dmv_facility.create_or_facilities(or_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.or_locations.size).to eq(59)
      expect(dmv_facility.or_locations.first).to be_an_instance_of(Facility)
      expect(dmv_facility.or_locations.last).to be_an_instance_of(Facility)
      expect(dmv_facility.or_locations.last.address.include?("OR")).to eq(true)
      expect(dmv_facility.or_locations.last.address.include?("MO")).to eq(false)
      expect(dmv_facility.locations).to be_an_instance_of(Array)
      expect(dmv_facility.locations.size).to eq(59)
      expect(dmv_facility.locations.first.address.include?("OR")).to eq(true)
      expect(dmv_facility.locations.last.address.include?("OR")).to eq(true)
    end

    it 'can create ny dmv facility objects' do
      dmv_facility = DmvFacility.new
      ny_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(dmv_facility.create_ny_facilities(ny_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.ny_locations.size).to eq(169)
      expect(dmv_facility.ny_locations.first.address).to be_an_instance_of(String)
      expect(dmv_facility.ny_locations.first.address.include?("NY")).to eq(true)
      expect(dmv_facility.ny_locations.last.address.include?("NY")).to eq(true)
      expect(dmv_facility.ny_locations.last.address.include?("OR")).to eq(false)
      expect(dmv_facility.locations.size).to eq(169)
      expect(dmv_facility.locations.first.address).to be_an_instance_of(String)
      expect(dmv_facility.locations.first.address.include?("NY")).to eq(true)
      expect(dmv_facility.locations.last.address.include?("NY")).to eq(true)
      expect(dmv_facility.locations.last.address.include?("PG")).to eq(false)
    end

   it 'can create mo dmv facility objects' do
      dmv_facility = DmvFacility.new
      mo_facilities = DmvDataService.new.mo_dmv_office_locations

      expect(dmv_facility.create_mo_facilities(mo_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.mo_locations.size).to eq(178)
      expect(dmv_facility.mo_locations.first.address).to be_an_instance_of(String)
      expect(dmv_facility.mo_locations.first.address.include?("MO")).to eq(true)
      expect(dmv_facility.mo_locations.last.address.include?("MO")).to eq(true)
      expect(dmv_facility.mo_locations.last.address.include?("NY")).to eq(false)
      expect(dmv_facility.mo_locations.last.address.include?("OR")).to eq(false)
      expect(dmv_facility.locations.size).to eq(178)
      expect(dmv_facility.locations.first.address).to be_an_instance_of(String)
      expect(dmv_facility.locations.first.address.include?("MO")).to eq(true)
      expect(dmv_facility.locations.last.address.include?("MO")).to eq(true)
      expect(dmv_facility.locations.last.address.include?("BQ")).to eq(false)
    end
  end

  describe '#create objects from different states in one method' do
    it 'can create ny_dmv_facilities from multiple source method' do
      dmv_facility = DmvFacility.new
      ny_facilities = DmvDataService.new.ny_dmv_office_locations

      expect(dmv_facility.locations).to eq([])
      expect(dmv_facility.ny_locations).to eq([])
      expect(dmv_facility.create_facilities(ny_facilities)).to be_an_instance_of(Array)
      expect(dmv_facility.locations.first).to be_an_instance_of(Facility)
      expect(dmv_facility.ny_locations.first).to be_an_instance_of(Facility)
      expect(dmv_facility.locations.length).to eq(169) 
      expect(dmv_facility.ny_locations.size).to eq(169)
    end

    it 'creates ny, mo, and or using same method' do
      dmv_facility = DmvFacility.new
      ny_facilities = DmvDataService.new.ny_dmv_office_locations
      mo_facilities = DmvDataService.new.mo_dmv_office_locations
      or_facilities = DmvDataService.new.or_dmv_office_locations
    end
  end
end