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

  describe '#add_multiple_facilities' do
    it 'can add CO facilities' do
      co_dmv_facilities  = DmvDataService.new.co_dmv_office_locations
      expect(@dmv.facilities).to eq([])

      @dmv.add_multiple_facilities(co_dmv_facilities)
      expect(@dmv.instance_variable_get(:@facilities).length).to eq(5)
      expect(@dmv.instance_variable_get(:@facilities)).to all be_a Facility

      expect(@dmv.facilities_offering_service('Vehicle Registration').length).to be 5
      expect(@dmv.facilities_offering_service('Renew License').length).to be 0

      expect(@dmv.facilities[0].name).to eq('DMV Tremont Branch')
      expect(@dmv.facilities[0].address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@dmv.facilities[0].phone).to eq('(720) 865-4600')
      expect(@dmv.facilities[4].services).to eq(['Vehicle Registration'])
      expect(@dmv.facilities[0].registered_vehicles).to eq([])
      expect(@dmv.facilities[0].collected_fees).to eq(0)
      expect(@dmv.facilities[3].hours).to eq('Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.')
    end

    it 'can add NY facilities' do
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations
      expect(@dmv.facilities).to eq([])

      @dmv.add_multiple_facilities(new_york_facilities)
      expect(@dmv.instance_variable_get(:@facilities).length).to eq(172)
      expect(@dmv.instance_variable_get(:@facilities)).to all be_a Facility

      expect(@dmv.facilities_offering_service('Vehicle Registration').length).to be 0
      expect(@dmv.facilities_offering_service('Written Test').length).to be 0
      expect(@dmv.facilities_offering_service('Road Test').length).to be 0
      expect(@dmv.facilities_offering_service('Renew License').length).to be 0

      expect(@dmv.facilities[0].name).to eq('EVANS')
      expect(@dmv.facilities[0].address).to eq('6853 ERIE RD DERBY NY 14006')
      expect(@dmv.facilities[0].phone).to eq('(716) 858-7450')
      expect(@dmv.facilities[0].services).to eq([])
      expect(@dmv.facilities[0].registered_vehicles).to eq([])
      expect(@dmv.facilities[0].collected_fees).to eq(0)
      expect(@dmv.facilities[0].collected_fees).to eq(0)
      expect(@dmv.facilities[0].hours).to eq('Mon: 9:00 AM-5:00 PM, Tue: 9:00 AM-5:00 PM, Wed: 9:00 AM-5:00 PM, Thu: 9:00 AM-5:00 PM, Fri: 9:00 AM-5:00 PM')
    end

    it 'can add MO facilities' do
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      expect(@dmv.facilities).to eq([])

      @dmv.add_multiple_facilities(missouri_facilities)
      expect(@dmv.instance_variable_get(:@facilities).length).to eq(178)
      expect(@dmv.instance_variable_get(:@facilities)).to all be_a Facility

      expect(@dmv.facilities_offering_service('Vehicle Registration').length).to be 0
      expect(@dmv.facilities_offering_service('Written Test').length).to be 0
      expect(@dmv.facilities_offering_service('Road Test').length).to be 0
      expect(@dmv.facilities_offering_service('Renew License').length).to be 0

      expect(@dmv.facilities[0].name).to eq('OAKVILLE')
      expect(@dmv.facilities[0].address).to eq('3164 TELEGRAPH ROAD ST LOUIS MO 63125')
      expect(@dmv.facilities[0].phone).to eq('(314) 887-1050')
      expect(@dmv.facilities[0].services).to eq([])
      expect(@dmv.facilities[0].registered_vehicles).to eq([])
      expect(@dmv.facilities[0].collected_fees).to eq(0)
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
end
