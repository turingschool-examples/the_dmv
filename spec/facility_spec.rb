require 'spec_helper'


RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
    it 'can register vehicle' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_within(1.0).of(Time.now)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility.registered_vehicles).to eq([@cruz])
      expect(@facility.collected_fees).to eq(100)

    end
    
  end
  describe 'written test' do
    it 'can take test' do
      expect(@registrant_1.name).to eq("Bruce")
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
      expect(@facility.administer_written_test(@registrant_1)).to be(false)
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(@registrant_1)).to be(!false)
      expect(@registrant_1.license_data).to eq({:license=>false, :renewed=>false, :written=>!false})
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(!true)
      expect(@facility.administer_written_test(@registrant_2)).to be (false)
      @registrant_2.earn_permit
      expect(@facility.administer_written_test(@registrant_2)).to be (!false)
      expect(@registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>!false})
      expect(@facility.administer_written_test(@registrant_3)).to be (false)
      @registrant_3.earn_permit
      expect(@facility.administer_written_test(@registrant_3)).to be (false)
    end
  end
  describe 'road test' do
    it 'can do road test' do
      expect(@facility.administer_road_test(@registrant_3)).to be(false)
      expect(@facility.administer_road_test(@registrant_1)).to be(false)
      @facility.add_service('Road Test')
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      expect(@facility.administer_road_test(@registrant_1)).to be(!false)
      expect(@registrant_1.license_data).to eq({:license=>!false, :renewed=>false, :written=>!false})
    end
  end
  describe 'renew license' do
    it 'renews' do
      @facility.add_service('Road Test')
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      expect(@facility.administer_road_test(@registrant_1)).to be(!false)
      expect(@registrant_1.license_data).to eq({:license=>!false, :renewed=>false, :written=>!false})
    end
  end
end
