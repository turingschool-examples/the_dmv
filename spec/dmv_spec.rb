require_relative 'spec_helper'

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

  describe '#parse_facilities' do
    it 'should create Facility objects and add them to its @facilities' do
      dds = DmvDataService.new
      dmv_co = Dmv.new
      dmv_ny = Dmv.new
      dmv_mo = Dmv.new
      co_data = dds.co_dmv_office_locations
      ny_data = dds.ny_dmv_office_locations
      mo_data = dds.mo_dmv_office_locations

      dmv_co.parse_facilities(co_data)
      expect(dmv_co.facilities[0].name).to eq "DMV Tremont Branch"
      dmv_ny.parse_facilities(ny_data)
      expect(dmv_ny.facilities[0].name).to eq "EVANS"
      dmv_mo.parse_facilities(mo_data)
      expect(dmv_mo.facilities[0].name).to eq "OAKVILLE"
    end
  end
end
