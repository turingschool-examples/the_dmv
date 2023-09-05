require 'spec_helper'

RSpec.describe Dmv do
  before(:each) do
    @dmv = Dmv.new
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @facility_3 = Facility.new({name: 'DMV Northwest Branch', address: '3698 W. 44th Avenue Denver CO 80211', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@dmv).to be_an_instance_of(Dmv)
      expect(@dmv.facilities).to eq([])
    end
  end

  describe '#add facilities' do
    it 'can add available facilities' do
      expect(@dmv.facilities).to eq([])
      @dmv.add_facility(@facility_1)
      expect(@dmv.facilities).to eq([@facility_1])
    end
  end

  describe '#facilities_offering_service' do
    it 'can return list of facilities offering a specified Service' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_2.add_service('New Drivers License')
      @facility_2.add_service('Road Test')
      @facility_2.add_service('Written Test')
      @facility_3.add_service('New Drivers License')
      @facility_3.add_service('Road Test')
      @dmv.add_facility(@facility_1)
      @dmv.add_facility(@facility_2)
      @dmv.add_facility(@facility_3)
      expect(@dmv.facilities_offering_service('Road Test')).to eq([@facility_2, @facility_3])
    end
  end

  describe "facilities from other states" do
    it 'can pull API information from CO' do
      colorado_locations = DmvDataService.new.co_dmv_office_locations
      co_facilities = Dmv.new
      co_facilities.import_facility(colorado_locations)
      expect(co_facilities).to be_an_instance_of(Dmv)
      expect(co_facilities.facilities).to be_an_instance_of(Array)
      expect(co_facilities.facilities.first).to be_an_instance_of(Facility)
    end
    
    it 'can pull API information from NY' do
      new_york_locations = DmvDataService.new.ny_dmv_office_locations
      ny_facilities = Dmv.new
      ny_facilities.import_facility(new_york_locations)
      expect(ny_facilities).to be_an_instance_of(Dmv)
      expect(ny_facilities.facilities).to be_an_instance_of(Array)
      expect(ny_facilities.facilities.first).to be_an_instance_of(Facility)
    end
    
    it 'can pull API information from MO' do
      missouri_locations = DmvDataService.new.mo_dmv_office_locations
      mo_facilities = Dmv.new
      mo_facilities.import_facility(missouri_locations)
      expect(mo_facilities).to be_an_instance_of(Dmv)
      expect(mo_facilities.facilities).to be_an_instance_of(Array)
      expect(mo_facilities.facilities.first).to be_an_instance_of(Facility)
    end
  end
end

