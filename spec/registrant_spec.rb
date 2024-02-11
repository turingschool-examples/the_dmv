require 'spec_helper'

RSpec.describe Registrant do
    before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    end

  describe '#initialize' do
    it 'initializes' do
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2.permit).to eq(false)
    end
  end

  describe '#license data' do
    it 'can earn a permit' do
      @registrant_2.earn_permit
      
      expect(@registrant_2.permit).to be true
    end

    it 'can take a written test if service offered' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to eq(true)
    end

    it 'checks for permit before written test' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to eq(false)
    end

    it 'checks for written test before road test' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to eq(true)
      expect(@registrant_1.license_data[:license]).to eq(true)
    end

    it 'checks for license before renewing license' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@registrant_1)
      @facility_1.addservice('Renew License')
      @facility_1.renew_drivers_license(@registrant_1)

      expect(@registrant_1.license_data[:renewed]).to eq(true)
    end
  end
end